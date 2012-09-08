from flask import current_app
# from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from flask.ext.sqlalchemy import SQLAlchemy
# from database import Base

db = SQLAlchemy()

class File(db.Model):
	"""This model represents the media files uploaded from user"""
	__tablename__ = "file"
	id = db.Column(db.Integer, primary_key=True, autoincrement=True)
	title = db.Column(db.String(150))
	name = db.Column(db.String(1000))

