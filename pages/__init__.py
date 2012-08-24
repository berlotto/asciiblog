# -*- encoding: utf-8 -*-
from flask import Blueprint, current_app, render_template, abort, flash, request, url_for, redirect, session, make_response, jsonify
from datetime import datetime
from model import Page
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm.exc import NoResultFound
from flaskext.uploads import UploadNotAllowed
import sys
import util

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

pages = Blueprint('pages', __name__, template_folder='templates', static_folder='static')

db = SQLAlchemy()

@pages.route('/<slug>/')
def view(slug):
	try:
		pagina = Page.query.filter(Page.slug==slug).one()
		if not pagina:
			return abort(404)
		else:
			sidebar=util.last_contents()
			return render_template('pages_view.html', page=pagina, sidebar=sidebar)
	except NoResultFound:
		return abort(404)

@pages.route('/edit/<slug>/')
def edit(slug):
	try:
		pagina = Page.query.filter(Page.slug==slug).one()
		if not pagina:
			return abort(404)
		else:
			return render_template('pages_new.html', page=pagina)
	except NoResultFound:
		return abort(404)


@pages.route('/')
def index():
	pages = Page.query.order_by("title")
	return render_template('pages_index.html',pages=pages)


@pages.route('/new')
def new():
	return render_template('pages_new.html')


@pages.route('/save/',methods = ['POST',])
def save():
	try:
		add = False
		title = request.form['title']
		content = request.form['content']
		slug = request.form['slug']
		if 'id' in request.form:
			page = Page.query.get(request.form['id'])
			cache.delete('view-page-%s' % slug) #Remove this page from cache for update in next view
		else:
			add =  True
			page = Page()
			page.date_created = datetime.today()
		
		page.title = title
		page.content = content
		page.slug = slug
		page.date_updated = datetime.today()
		if add:
			db.session.add(page)

		db.session.commit()
		
		data = {}
		data['message'] = "Página salva com sucesso! <a href='%s'>Visualizar</a>" % url_for('pages.view',  slug=slug)
		data['id'] = page.id
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




@pages.route('/delete/',methods = ['POST',])
def delete():
	pass
