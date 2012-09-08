# -*- encoding: utf-8 -*-

from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask.ext.sqlalchemy import SQLAlchemy
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from general.models import Link, Like
from jinja2 import evalcontextfilter, Markup, escape
from flask.ext.login import login_required, current_user
import markdown
import util
import traceback
import os

#========================================= CONFIGURATION
app = Flask(__name__)
try:
	app.config.from_pyfile('asciiblog.cfg')
except:
	print('-> Config file not found!')

db = SQLAlchemy(app)

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

#+======================================== CONTEXT PROCESSORS
@app.context_processor
def inject_user():
	#Adiciona o usuario corrent no contexto dos templates
    return dict(user=current_user)

@app.context_processor
def inject_verify_login():
	def is_authenticated():
		if current_user and current_user.is_active() :
			return True
		else:
			return False
	return dict(is_authenticated=is_authenticated)

@app.context_processor
def inject_current_url():
	def current_url():
		return request.path
	return dict(current_url=current_url)

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
	default = 'http://'+app.config['SERVER_NAME']+url_for('static', filename='img/default_gravatar.png')
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
from auth import auth, init_auth

#========================================= UPLOADS
from flaskext.uploads import UploadSet, configure_uploads, IMAGES, UploadNotAllowed

uploaded_files = UploadSet('postfile', IMAGES, default_dest=lambda app: 'post-images')
uploaded_media = UploadSet('media', default_dest=lambda app: 'uploaded-media')
configure_uploads(app, (uploaded_files, uploaded_media))

#========================================= BLUEPRINTS APPS
app.register_blueprint(auth, url_prefix='/user')
app.register_blueprint(blog, url_prefix='/blog')
blog.register_uploader(uploaded_files)
app.register_blueprint(media, url_prefix='/media')
app.register_blueprint(pages, url_prefix='/pages')

init_auth(app)

#========================================= ERROR TEMPLATES

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template('500.html'), 500

@app.errorhandler(401)
def page_not_found(e):
    return render_template('401.html'), 401

@app.errorhandler(400)
def page_not_found(e):
    return render_template('400.html'), 400

#========================================= MAIN ROUTES
@app.route('/')
def index():
	twitts, posts, comments, photo, random_posts = util.last_contents()
	# fp = cache.get('featured_posts')
	# if not fp:
	featured_posts = Post.query.filter(Post.featured=='Y')
		#cache.set('featured_posts', featured_posts)
	return render_template('home.html', posts=posts, featured_posts=featured_posts, 
		                                comments=comments, twitts=twitts, 
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

#========================================= ROUTE FOR LINKS
@app.route('/links/')
@login_required
def links():
	try:
		page = "1"
		if 'page' in request.args:
			page = request.args['page']
		links = Link.query.order_by('id').paginate(page=int(page), per_page=app.config['POSTS_PER_PAGE']).items
		# links = []
	except:
		traceback.print_exc()
	return render_template('links.html', links=links)

@app.route('/link/edit/<int:link_id>')
@login_required
def edit_link(link_id):
	pass

@app.route('/link/delete/<int:link_id>')
@login_required
def delete_link(link_id):
	pass

#========================================= ROUTE FOR FEEDS
@app.route('/feed/')
@login_required
def feed():
	pass

#========================================= MAIN APP
if __name__ == '__main__':
	app.run(host='0.0.0.0', debug=True)
