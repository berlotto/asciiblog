# -*- encoding: utf-8 -*-
from flask import Blueprint, current_app, render_template, abort, flash, request, url_for, redirect, session, make_response, jsonify
from datetime import datetime
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm.exc import NoResultFound
from flaskext.uploads import UploadNotAllowed
import sys

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

media = Blueprint('media', __name__, template_folder='templates', static_folder='static')

db = SQLAlchemy()

@media.route('/')
def index():
	return render_template('media_index.html')

@media.route('/upload/')
def upload():
	pass

@media.route('/delete/')
def delete():
	pass
