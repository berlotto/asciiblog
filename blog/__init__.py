# -*- encoding: utf-8 -*-
from flask import Blueprint, render_template, abort, flash, request, url_for, redirect
from models import Post, Comment, Like, Link
from database import db_session
from datetime import datetime
from sqlalchemy.exc import IntegrityError
import sys

blog = Blueprint('blog', __name__, template_folder='templates', static_folder='static')

@blog.route('/')
def blog_index():
	posts = db_session.query(Post).order_by("date_created").limit(10)
	return render_template('index.html',posts=posts)

@blog.route('/new-post')
def new_post():
	return render_template('new-post.html')

@blog.route('/article/<slug>/')
def view_post(slug):
	return render_template('one-post.html')

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

		flash('Post salvo com sucesso')
		return redirect(url_for('view_post',slug=slug))
	except IntegrityError as e:
		db_session.rollback()
		flash( "O Slug informado ja existe. Altere e tente novamente." )
		return redirect(url_for('blog.new_post'))
	except:
		db_session.rollback()
		print "Unexpected error:", sys.exc_info()[0]
    	raise