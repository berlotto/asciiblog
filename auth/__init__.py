#! -*- encoding: utf8 -*-
from flask import Blueprint, current_app, render_template, abort, flash, request, url_for, redirect, session, make_response, jsonify
from flask.ext.login import LoginManager, login_user, current_user, logout_user
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.orm.exc import NoResultFound
from models import User
import hashlib

auth = Blueprint('auth', __name__, template_folder='templates', static_folder='static')

db = SQLAlchemy()

login_manager = LoginManager()

def init_auth(app):
	login_manager.setup_app(app)

@login_manager.user_loader
def load_user(userid):
	return User.query.filter(User.id==userid).one()

@auth.route('/logout/')
def logout():
	logout_user()
	next = request.args.get('next') or request.referrer or url_for("index")
	return redirect(next)

@auth.route("/login/", methods=["GET", "POST"])
def login():
	next = request.args.get('next') or request.referrer or url_for("index")
	print "VAI PARA:", next
	if request.method == 'POST':
		print "Login POST"
		usuario, senha = request.form['inputLogin'], request.form['inputPassword']
		if usuario and senha:
			# login and validate the user...
			try:
				user = User.query.filter(User.login==usuario).one()
				if user:
					hash_senha = hashlib.md5( senha ).hexdigest()
					if hash_senha == user.password:
						login_user(user)
						flash("Login efetuado com sucesso.")
						return redirect(next)
					else:
						flash("Usuario ou senha incorretos.")
				else:
					flash("Usuario ou senha incorretos")
			except NoResultFound:
				flash("Usuario ou senha incorretos")
	return render_template("login.html",next=next)
