from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy import func
from sqlalchemy.sql.operators import ColumnOperators
from werkzeug.contrib.cache import MemcachedCache, SimpleCache
from blog.models import Post, Comment
from json import loads
from urllib import urlopen
from flask import current_app
import flickrapi
import feedparser
import random
import twitter

#Deve ser configuravel atraves do asciiblog.cfg
cache = SimpleCache()
#cache = MemcachedCache(['127.0.0.1:11211'])

db = SQLAlchemy()

# api.update_status('Updating using OAuth authentication via Tweepy!') #this write to timeline
#========================================= UTIL METHODS
def get_twitter_api():
	tweet = twitter.Api(
	    consumer_key = current_app.config['TWITTER_CONSUMER_KEY'],
	    consumer_secret = current_app.config['TWITTER_CONSUMER_SECRET'],
	    access_token_key = current_app.config['TWITTER_ACCESS_TOKEN'],
	    access_token_secret = current_app.config['TWITTER_ACCESS_TOKEN_SECRET']
	    )
	return tweet

def get_twitts():
	
	#http://code.google.com/p/python-twitter/
	tl = cache.get('twitts')
	if not tl:
		tweet = get_twitter_api()
		tl = tweet.GetUserTimeline(count=5,include_entities=True,include_rts=True)
		cache.set('twitts', tl)
	return tl

def last_contents():
	#get last tweets
	twitts = get_twitts()
	#get last posts
	posts = cache.get('posts')
	if not posts:
		posts = Post.query.order_by("date_created desc").limit(10).all()
		cache.set('posts', posts)
	#get last comments
	comments = cache.get('comments')
	if not comments:
		comments = Comment.query.order_by("date_created desc").limit(10).all()
		cache.set('comments', comments)
	#last photo of flickr from RSS
	d = cache.get('twitter_feed')
	if not d:
		d = feedparser.parse('http://api.flickr.com/services/feeds/photos_public.gne?id=51882400@N00&lang=pt-br&format=rss_200')
		cache.set('twitter_feed',d, timeout=5 * 60)
	#last_photo = d['entries'][0]['media_thumbnail'][0]['url']
	last_photo = d['entries'][0]['summary']
	#random posts
	max_post_id = cache.get('max_post_id')
	if not max_post_id:
		max_post_id = db.session.query(func.count(Post.id)).first()[0]
		cache.set('max_post_id',max_post_id)
	random_ids = list(set([random.randint(1,max_post_id) for x in xrange(10)])) #10 ids aleatorios para o array
	#this have max 10 posts, and not set in cache!
	random_posts = Post.query.filter(Post.id.in_(random_ids)).all()

	return (twitts, posts, comments, last_photo, random_posts)