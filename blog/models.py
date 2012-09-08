from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class Post(db.Model):
	__tablename__ = 'post'
	id = db.Column(db.Integer, db.Sequence('post_id'), primary_key=True)
	title = db.Column(db.String(150))
	slug = db.Column(db.String(500), unique=True)
	resume = db.Column(db.String(1000))
	content = db.Column(db.Text)
	date_created = db.Column(db.DateTime)
	date_updated = db.Column(db.DateTime)
	picture	= db.Column(db.String(2000))  #Complete path of picture file
	picture_url	= db.Column(db.String(2000))  #The static url of picture file
	short_url	= db.Column(db.String(1000))  #The short url if exists
	featured = db.Column(db.String(1)) #may be 'S' or ('N','')
	tags = db.Column(db.String(4000))

	def __repr__(self):
		return '<Post %r>' % (self.slug)


class Comment(db.Model):
	__tablename__ = 'comment'
	id = db.Column(db.Integer,  db.Sequence('comment_id'), primary_key=True)
	name = db.Column(db.String(150))
	email = db.Column(db.String(500))
	content = db.Column(db.String(2000))
	date_created = db.Column(db.DateTime)
	display = db.Column(db.Boolean)
	post_id = db.Column(db.Integer, db.ForeignKey("post.id"))
	reply_for = db.Column(db.Integer, db.ForeignKey("comment.id")) # for specify if this comment is a reply for other comment



