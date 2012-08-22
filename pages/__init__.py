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

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

pages = Blueprint('pages', __name__, template_folder='templates', static_folder='static')

db = SQLAlchemy()

@pages.route('/<slug>/')
def view():
	return render_template('page_view.html')


@pages.route('/')
def index():
	return render_template('pages_index.html')


@pages.route('/save/')
def upload():
	pass


@pages.route('/delete/')
def delete():
	pass
