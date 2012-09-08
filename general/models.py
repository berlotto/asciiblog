from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class Link(db.Model):
	__tablename__ = 'link'
	id = db.Column(db.Integer, db.Sequence('link_id'), primary_key=True)
	title = db.Column(db.String(150))
	url = db.Column(db.String(2000), unique=True)
	short_url = db.Column(db.String(1000))
	sidebar = db.Column(db.Boolean) #Show or Not this link in sidebar

	def __repr__(self):
		return '<Link %r>' % (self.shorturl)

class Like(db.Model):
	__tablename__ = 'like'
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	comment = db.Column(db.Integer, db.ForeignKey('comment.id'))
	post = db.Column(db.Integer, db.ForeignKey('post.id'))
	link = db.Column(db.Integer, db.ForeignKey('link.id'))
