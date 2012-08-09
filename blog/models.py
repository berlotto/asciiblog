from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Text
from database import Base

class Post(Base):
	__tablename__ = 'post'
	id = Column(Integer, primary_key=True, autoincrement=True)
	title = Column(String(150))
	slug = Column(String(500), unique=True)
	resume = Column(String(1000))
	content = Column(Text)
	date_created = Column(DateTime)
	date_updated = Column(DateTime)
	picture	= Column(String(200)) #path of banner picture for this post

	def __repr__(self):
		return '<Post %r>' % (self.slug)

class Comment(Base):
	__tablename__ = 'comment'
	id = Column(Integer, primary_key=True, autoincrement=True)
	content = Column(String(2000))
	date_created = Column(DateTime)
	reply_for = Column(Integer, ForeignKey("comment.id")) # for specify if this comment is a reply for other comment

class Link(Base):
	__tablename__ = 'link'
	id = Column(Integer, primary_key=True, autoincrement=True)
	name = Column(String(100))
	url = Column(String(1000))

class Like(Base):
	__tablename__ = 'like'
	id = Column(Integer, primary_key=True, autoincrement=True)
	comment = Column(Integer, ForeignKey('comment.id'))
	post = Column(Integer, ForeignKey('post.id'))
	link = Column(Integer, ForeignKey('link.id'))

