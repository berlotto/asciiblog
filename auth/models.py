from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class User(db.Model):
	__tablename__ = 'user'
	id = db.Column(db.Integer, db.Sequence('user_id'), primary_key=True)
	name = db.Column(db.String(150))
	login = db.Column(db.String(500), unique=True)
	password = db.Column(db.String(1000))
	email = db.Column(db.String(1000)) #may be 'S' or ('N','')

	def is_active(self):
		return True

	def is_authenticated(self):
		return True

	def is_anonymous(self):
		return False

	def get_id(self):
		return self.id

	def __repr__(self):
		return '<User %r>' % (self.login)