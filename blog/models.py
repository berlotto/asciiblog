from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class Post(db.Model):
	__tablename__ = 'post'
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	title = db.Column(db.String(150))
	slug = db.Column(db.String(500), unique=True)
	resume = db.Column(db.String(1000))
	content = db.Column(db.Text)
	date_created = db.Column(db.DateTime)
	date_updated = db.Column(db.DateTime)
	picture	= db.Column(db.Integer, db.ForeignKey("file.id")) #id if File that is used for banner
	featured = db.Column(db.String(1)) #may be 'S' or ('N','')

	def __repr__(self):
		return '<Post %r>' % (self.slug)


class File(db.Model):
	"""This model represents the media files uploaded from user"""
	__tablename__ = "file"
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	title = db.Column(db.String(150))
	name = db.Column(db.String(1000))

class Comment(db.Model):
	__tablename__ = 'comment'
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	content = db.Column(db.String(2000))
	date_created = db.Column(db.DateTime)
	reply_for = db.Column(db.Integer, db.ForeignKey("comment.id")) # for specify if this comment is a reply for other comment

class Link(db.Model):
	__tablename__ = 'link'
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	name = db.Column(db.String(100))
	url = db.Column(db.String(1000))

class Like(db.Model):
	__tablename__ = 'like'
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	comment = db.Column(db.Integer, db.ForeignKey('comment.id'))
	post = db.Column(db.Integer, db.ForeignKey('post.id'))
	link = db.Column(db.Integer, db.ForeignKey('link.id'))

