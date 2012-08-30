# -*- encoding: utf-8 -*-

from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask.ext.sqlalchemy import SQLAlchemy
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from jinja2 import evalcontextfilter, Markup, escape
import markdown
import util
import os

#========================================= CONFIGURATION
app = Flask(__name__)
try:
	app.config.from_pyfile('asciiblog.cfg')
except:
	print('-> Config from env vars')
	# Generate with os.urandom(24)
	SECRET_KEY=os.environ.get('SECRET_KEY','O\xde\xbe\xe5\x18\xa3\x18\xcdFos\xd1\x03(\xba\xd59+\x97&\xa2D\x9cb')
	#Folder where files wil be uploaded
	UPLOADED_POSTFILE_DEST = os.environ.get('UPLOADED_POSTFILE_DEST', './static/uploads/')
	#Url for access the uploaded files
	UPLOADED_FILE_URL=os.environ.get('UPLOADED_FILE_URL','/static/uploads/')
	SESSION_COOKIE_NAME=os.environ.get('SESSION_COOKIE_NAME','asciiblog')
	SESSION_COOKIE_SECURE=False
	POSTS_PER_PAGE=os.environ.get('POSTS_PER_PAGE',5)
	SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI','postgresql://asciiblog:asciiblog@localhost:5432/asciiblog')
	TWITTER_CONSUMER_KEY=os.environ.get('TWITTER_CONSUMER_KEY',"")
	TWITTER_CONSUMER_SECRET=os.environ.get('TWITTER_CONSUMER_SECRET',"")
	TWITTER_ACCESS_TOKEN=os.environ.get('TWITTER_ACCESS_TOKEN',"")
	TWITTER_ACCESS_TOKEN_SECRET=os.environ.get('TWITTER_ACCESS_TOKEN_SECRET',"")
	pass


db = SQLAlchemy(app)

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

#========================================= CUSTOM FILTERS FOR JINJA
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

@app.template_filter()
@evalcontextfilter
def gravatar(env, email):
	import urllib, hashlib
	default = 'http://localhost:8000'+url_for('static', filename='img/default_gravatar.png')
	print default
	size = 40

	# construct the url
	gravatar_url = "http://www.gravatar.com/avatar/" + hashlib.md5(email.lower()).hexdigest() + "?"
	gravatar_url += urllib.urlencode({'d':default, 's':str(size)})

	if env.autoescape:
		gravatar_url = Markup(gravatar_url)

	return gravatar_url

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


#========================================= MAIN ROUTES
@app.route('/')
def index():
	twitts, posts, comments, photo, random_posts = util.last_contents()
	return render_template('home.html', posts=posts, comments=comments, twitts=twitts, 
		                                flickr_photo=photo, random_posts=random_posts)

@app.route('/slugfy/')
def slugfy():
	from slugfy import slug
	text = request.args['text']
	return jsonify(slug=slug(text))

@app.route('/oauth_token')
def instagram_token():
	if 'access_token' in request.args:
		app.config['instagram_token'] = request.args['access_token']

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
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
