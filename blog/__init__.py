# -*- encoding: utf-8 -*-
from flask import Blueprint, current_app, render_template, abort, flash, request, url_for, redirect, session, make_response, jsonify
from models import Post, Comment
from general.models import Link, Like
# from database import db_session
from datetime import datetime
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm.exc import NoResultFound
from flaskext.uploads import UploadNotAllowed
from flask.ext.login import login_required, current_user
import sys
import util
import traceback


#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

blog = Blueprint('blog', __name__, template_folder='templates', static_folder='static')
uploaded_files = None

db = SQLAlchemy()

def register_uploader(obj):
	global uploaded_files
	uploaded_files = obj

blog.register_uploader = register_uploader

@blog.route('/')
def blog_index():
	# print 'POSTS_PER_PAGE', current_app.config['POSTS_PER_PAGE']
	posts = Post.query.order_by("date_created desc").limit(current_app.config['POSTS_PER_PAGE'])
	resp = make_response( render_template('index.html',posts=posts, sidebar=util.last_contents()) )
	resp.set_cookie('blog_page', 1)
	return resp

@blog.route('/more/', methods=['POST','GET'])
def blog_more():
	page = int(request.cookies.get('blog_page')) + 1
	fim = False
	print "SESSION PAGE:", page

	# if page == 5:
	# 	fim = True
	try:
		posts = Post.query.order_by("date_created desc").paginate(page=page, per_page=current_app.config['POSTS_PER_PAGE']).items
		# posts = db_session.query(Post).order_by("date_created desc").limit(current_app.config['POSTS_PER_PAGE']).offset(page)
	except:
		# print "FIM Através de erro"
		posts = []
		fim = True

	if not posts:
		fim = True

	resp = make_response( render_template('more.html',posts=posts,fim=fim) )

	resp.set_cookie('blog_page', page)
	return resp

@blog.route('/list-posts')
@blog.route('/list-posts/<int:page>/')
def list_posts(page=1):
	posts = Post.query.order_by("date_created desc").paginate(page=page, per_page=30).items
	return render_template('list-posts.html', posts=posts)

@blog.route('/new-post')
@login_required
def new_post():
	return render_template('new-post.html')

@blog.route('/edit-post/<int:post_id>')
@login_required
def edit_post(post_id):
	post = Post.query.filter(Post.id==post_id).one()
	if post:
		return render_template('new-post.html',post=post)
	else:
		return abort(404)

@blog.route('/article/<slug>/')
def view_post(slug):
	try:
		post = cache.get('view-post-%s' % slug)
		if not post:
			post = Post.query.filter(Post.slug==slug).one()
			cache.set('view-post-%s' % slug, post)
		comentarios = Comment.query.filter(Comment.post_id==post.id,Comment.display==True)
		return render_template('one-post.html',post=post, comentarios=comentarios, sidebar=util.last_contents())
	except NoResultFound as nrf:
		return abort(404)

@blog.route('/savecomment',methods = ['POST',])
def save_comment():
	msg = "Comment not saved."
	try:
		nome = request.form['name']
		email = request.form['email']
		texto = request.form['content']
		post_id = request.form['post_id']
		comentario = Comment()
		comentario.name = nome
		comentario.email = email
		comentario.content = texto
		comentario.display = False
		comentario.date_created = datetime.today()
		comentario.post_id = post_id
		db.session.add(comentario)
		db.session.commit()
		msg = "Coment&aacute;rio enviado! Obrigado!"
	except:
		db.session.rollback()
		traceback.print_exc()
		#raise
	data = {}
	data['message'] = msg
	return jsonify(data)


@blog.route('/save-post',methods = ['POST',])
@login_required
def save_post():
	try:
		# print "RECEBIDO", request.form
		title = request.form['title']
		content = request.form['content']
		featured = 'N'
		if "featured" in request.form:
			featured = 'Y'
			#Limpa o cache para atualizar na proxima chamada da capa.
			#cache.delete("featured_posts")
			print "FEATURED POST"
		resume = request.form['resume']
		slug = request.form['slug']
		tags = request.form['tags']

		add = False
		if 'id' in request.form:
			post = Post.query.get(request.form['id'])
			cache.delete('view-post-%s' % slug) #Remove this post from cache for update in next view
		else:
			add =  True
			post = Post()
			post.date_created = datetime.today()
			post.short_url = util.encurtar(url_for('blog.view_post',  slug=slug))

		post.title = title
		post.content = content
		post.resume = resume
		post.featured = featured
		post.slug = slug
		post.date_updated = datetime.today()
		#post.picture = '' #don't clear this field if edit
		post.tags = tags

		try:
			global uploaded_files
			photo = request.files.get('postfile')
			if photo:
				print "SALVANDO A IMAGEM DO POST"
				filename = uploaded_files.save(photo)
				post.picture = uploaded_files.path(filename)
				post.picture_url = uploaded_files.url(filename)
				#print 'UPLOADED:', uploaded_files.path(filename)

				#Gerar um thumbnail para mostrar dentro do post
				#200x150 - Dentro do post
				#220x100 - Lista de posts
			else:
				print "POST SEM IMAGEM"

		except UploadNotAllowed:
			flash("The upload was not allowed")

		if add:
			db.session.add(post)
		else:
			db.session.merge(post)
		db.session.commit()
		# flash('Post salvo com sucesso')
		# return redirect(url_for('blog.view_post',  slug=slug))

		data = {}
		data['message'] = "Post salvo com sucesso! <a href='%s'>Visualizar</a>" % url_for('blog.view_post',  slug=slug)
		data['id'] = post.id
		return jsonify(data)

	except IntegrityError as e:
		db.session.rollback()
		data = {}
		data['message'] = "O Slug informado ja existe. Altere e tente novamente."
		return jsonify(data)
	except:
		db.session.rollback()
		print "Unexpected error:", sys.exc_info()[0]
    	raise
