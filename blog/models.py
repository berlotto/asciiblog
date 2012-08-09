from sqlalchemy import Column, Integer, String, DateTime
from asciiblog.database import Base

class Post(Base):
	__tablename__ = 'post'
	id = Column(Integer, primary_key=True)
	title = Column(String(150))
	slug = Column(String(500))
	resume = Column(String(1000))
	content = Column(String(10000))
	date_created = Column(DateTime)
	date_updated = Column(DateTime)
	picture	= Column(String(200)) #path of banner picture for this post

class Comment(Base)
	__tablename__ = 'comment'
	id = Column(Integer, primary_key=True)
	content = Column(String(2000))
	date_created = Column(DateTime)
	reply_for = Column(ForeignKey(Comment.id)) # for specify if this comment is a reply for other comment

class Links(Base):
	__tablename__ = 'links'
	id = Column(Integer, primary_key=True)
	name
	url

class Like(Base):
	__tablename__ = 'like'
	id = Column(Integer, primary_key=True)
	comment = 
	post = 
	link = 

