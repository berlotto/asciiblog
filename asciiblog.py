# -*- encoding: utf-8 -*-

from flask import Flask, render_template, request, jsonify
from database import db_session
import markdown
from json import loads
from urllib import urlopen
import flickrapi
import feedparser

#Blueprint Applications
from blog import blog
from blog.models import Post, Comment

#========================================= CONFIGURATION
app = Flask(__name__)
app.config.from_pyfile('asciiblog.cfg')

TWITTER_JSON_TIMELINE_URL = \
	"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=berlottocdd&include_rts=true&count=5"

#========================================= UPLOADS
from flaskext.uploads import UploadSet, configure_uploads, IMAGES, UploadNotAllowed

uploaded_files = UploadSet('postfile')
configure_uploads(app, uploaded_files)

#========================================= BLUEPRINTS APPS
app.register_blueprint(blog, url_prefix='/blog')
blog.register_uploader(uploaded_files)

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
	twitts = get_twitts()
	#get last posts
	posts = db_session.query(Post).order_by("date_created desc").limit(10)
	#get last comments
	comments = db_session.query(Comment).order_by("date_created desc").limit(10)
	#last photo of flickr from RSS
	d = feedparser.parse('http://api.flickr.com/services/feeds/photos_public.gne?id=51882400@N00&lang=pt-br&format=rss_200')
	#last_photo = d['entries'][0]['media_thumbnail'][0]['url']
	last_photo = d['entries'][0]['summary']
	return render_template('home.html', posts=posts, comments=comments, twitts=twitts, flickr_photo=last_photo)

@app.route('/slugfy/')
def slugfy():
	from slugfy import slug
	text = request.args['text']
	return jsonify(slug=slug(text))


#========================================= MAIN APP
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
