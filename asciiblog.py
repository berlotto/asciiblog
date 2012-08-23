# -*- encoding: utf-8 -*-

from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask.ext.sqlalchemy import SQLAlchemy
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
# from database import db_session
from sqlalchemy import func
from sqlalchemy.sql.operators import ColumnOperators
import markdown
from json import loads
from urllib import urlopen
import flickrapi
import feedparser
import random

#========================================= CONFIGURATION
app = Flask(__name__)
app.config.from_pyfile('asciiblog.cfg')

db = SQLAlchemy(app)

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

TWITTER_JSON_TIMELINE_URL = \
	"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=berlottocdd&include_rts=true&count=5"

#========================================= Blueprint Applications
from blog import blog
from blog.models import Post, Comment
from media import media
from pages import pages

#========================================= UPLOADS
from flaskext.uploads import UploadSet, configure_uploads, IMAGES, UploadNotAllowed

uploaded_files = UploadSet('postfile')
configure_uploads(app, uploaded_files)

#========================================= BLUEPRINTS APPS
app.register_blueprint(blog, url_prefix='/blog')
blog.register_uploader(uploaded_files)
app.register_blueprint(media, url_prefix='/media')
app.register_blueprint(pages, url_prefix='/pages')


#========================================= CUSTOM FILTERS FOR JINJA
from jinja2 import evalcontextfilter, Markup, escape

@app.template_filter()
@evalcontextfilter
def translate_markdown(env, texto):
	"""
	Method that translate from Markdown to HTML, for show in templates
	"""
	html = markdown.markdown(texto)
	if env.autoescape:
		html = Markup(html)
	return html

#========================================= UTIL METHODS
def get_twitts():
	json = urlopen(TWITTER_JSON_TIMELINE_URL).read()
	message = loads(json)
	return message

#========================================= MAIN ROUTES
@app.route('/')
def index():
	#get last tweets
	twitts = cache.get('twitts')
	if not twitts:
		twitts = get_twitts()
		cache.set('twitts', twitts)
	#get last posts
	posts = cache.get('cache')
	if not posts:
		posts = Post.query.order_by("date_created desc").limit(10).all()
		cache.set('posts', posts)
	#get last comments
	comments = cache.get('comments')
	if not comments:
		comments = Comment.query.order_by("date_created desc").limit(10).all()
		cache.set('comments', comments)
	#last photo of flickr from RSS
	d = cache.get('twitter_feed')
	if not d:
		d = feedparser.parse('http://api.flickr.com/services/feeds/photos_public.gne?id=51882400@N00&lang=pt-br&format=rss_200')
		cache.set('twitter_feed',d, timeout=5 * 60)
	#last_photo = d['entries'][0]['media_thumbnail'][0]['url']
	last_photo = d['entries'][0]['summary']
	#random posts
	max_post_id = cache.get('max_post_id')
	if not max_post_id:
		max_post_id = db.session.query(func.count(Post.id)).first()[0]
		cache.set('max_post_id',max_post_id)
	random_ids = list(set([random.randint(1,max_post_id) for x in xrange(10)])) #10 ids aleatorios para o array
	#this have max 10 posts, and not set in cache!
	random_posts = Post.query.filter(Post.id.in_(random_ids)).all()
	return render_template('home.html', posts=posts, comments=comments, twitts=twitts, 
		                                flickr_photo=last_photo, random_posts=random_posts)

@app.route('/slugfy/')
def slugfy():
	from slugfy import slug
	text = request.args['text']
	return jsonify(slug=slug(text))

#========================================= ROUTE FOR PAGES
@app.route('/<slug>/')
def page_(slug):
	'''
	Esta rota abre diretamente uma pagina, e está definida por ultimo para abrir somente
	slugs de paginas que não coinsidam com os nomes dos aplicativos definidos, como blog,media,etc..
	'''
	return redirect( url_for('pages.view', slug=slug))


#========================================= MAIN APP
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
