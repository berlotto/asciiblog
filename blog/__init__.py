# -*- encoding: utf-8 -*-
from flask import Blueprint, render_template, abort, flash, request, url_for, redirect
from models import Post, Comment, Like, Link
from database import db_session
from datetime import datetime
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm.exc import NoResultFound
from flaskext.uploads import UploadNotAllowed
import sys

blog = Blueprint('blog', __name__, template_folder='templates', static_folder='static')
uploaded_files = None

def register_uploader(obj):
	global uploaded_files
	uploaded_files = obj
	print "Gravado o salvador!"

blog.register_uploader = register_uploader

@blog.route('/')
def blog_index():
	posts = db_session.query(Post).order_by("date_created desc").limit(10)
	return render_template('index.html',posts=posts)

@blog.route('/new-post')
def new_post():
	return render_template('new-post.html')

@blog.route('/edit-post/<int:post_id>')
def edit_post(post_id):
	post = db_session.query(Post).filter(Post.id==post_id).one()
	if post:
		return render_template('new-post.html',post=post)
	else:
		return abort(404)

@blog.route('/article/<slug>/')
def view_post(slug):
	try:
		post = db_session.query(Post).filter(Post.slug==slug).one()
		return render_template('one-post.html',post=post)
	except NoResultFound as nrf:
		return abort(404)

@blog.route('/save-comment',methods = ['POST',])
def save_comment():
	return "Ok"

@blog.route('/save-post',methods = ['POST',])
def save_post():
	try:
		title = request.form['title']
		content = request.form['content']
		featured = 'N'
		if "featured" in request.form:
			featured = request.form['featured']
		if "resume" in request.form:
			resume = request.form['resume']
		slug = request.form['slug']

		post = Post()
		post.title = title
		post.content = content
		post.featured = featured or 'N'
		post.slug = slug
		post.date_created = datetime.today()
		post.date_updated = datetime.today()
		post.picture = ''

		db_session.add(post)
		db_session.commit()

		try:
			global uploaded_files
			photo = request.files.get('postfile')
			filename = uploaded_files.save(photo)
		except UploadNotAllowed:
			flash("The upload was not allowed")

		flash('Post salvo com sucesso')
		return redirect(url_for('view_post',  slug=slug))
	except IntegrityError as e:
		db_session.rollback()
		flash( "O Slug informado ja existe. Altere e tente novamente." )
		return redirect(url_for('blog.new_post'))
	except:
		db_session.rollback()
		print "Unexpected error:", sys.exc_info()[0]
    	raise
