from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class Page(db.Model):
	__tablename__ = 'page'
	id = db.Column(db.Integer,  db.Sequence('page_id'), primary_key=True)
	title = db.Column(db.String(150))
	slug = db.Column(db.String(500), unique=True)
	content = db.Column(db.Text)
	date_created = db.Column(db.DateTime)
	date_updated = db.Column(db.DateTime)

	def __repr__(self):
		return '<Post %r>' % (self.slug)
