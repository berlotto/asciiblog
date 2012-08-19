# -*- encoding: utf-8 -*-
from flask import Blueprint, current_app, render_template, abort, flash, request, url_for, redirect, session, make_response, jsonify
from models import Post, Comment, Like, Link
# from database import db_session
from datetime import datetime
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm.exc import NoResultFound
from flaskext.uploads import UploadNotAllowed
import sys

blog = Blueprint('blog', __name__, template_folder='templates', static_folder='static')
uploaded_files = None

db = SQLAlchemy()

def register_uploader(obj):
	global uploaded_files
	uploaded_files = obj

blog.register_uploader = register_uploader

@blog.route('/')
def blog_index():
	print 'POSTS_PER_PAGE', current_app.config['POSTS_PER_PAGE']
	posts = Post.query.order_by("date_created desc").limit(current_app.config['POSTS_PER_PAGE'])
	resp = make_response( render_template('index.html',posts=posts) )
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

@blog.route('/new-post')
def new_post():
	return render_template('new-post.html')

@blog.route('/edit-post/<int:post_id>')
def edit_post(post_id):
	post = Post.query.filter(Post.id==post_id).one()
	if post:
		return render_template('new-post.html',post=post)
	else:
		return abort(404)

@blog.route('/article/<slug>/')
def view_post(slug):
	try:
		post = Post.query.filter(Post.slug==slug).one()
		return render_template('one-post.html',post=post)
	except NoResultFound as nrf:
		return abort(404)

@blog.route('/save-comment',methods = ['POST',])
def save_comment():
	return "Ok"

@blog.route('/save-post',methods = ['POST',])
def save_post():
	try:
		print "RECEBIDO", request.form
		title = request.form['title']
		content = request.form['content']
		featured = 'N'
		if "featured" in request.form:
			featured = request.form['featured']
		resume = request.form['resume']
		slug = request.form['slug']

		add = False;
		if 'id' in request.form:
			post = Post.query.get(request.form['id'])
		else:
			add =  True
			post = Post()
			post.date_created = datetime.today()

		post.title = title
		post.content = content
		post.resume = resume
		post.featured = featured or 'N'
		post.slug = slug
		post.date_updated = datetime.today()
		post.picture = ''

		if add:
			db.session.add(post)

		db.session.commit()

		try:
			global uploaded_files
			photo = request.files.get('postfile')
			if photo:
				filename = uploaded_files.save(photo)
		except UploadNotAllowed:
			flash("The upload was not allowed")

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
