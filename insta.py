#! -*- encoding: utf8 -*-
from instagram.client import InstagramAPI

# Este access_token foi buscado através do script get_access_token
access_token="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

api = InstagramAPI(access_token=access_token)
# api = InstagramAPI(client_id='wwwwwwwwwwwwwww', client_secret='ssssssssssssss')
# popular_media = api.media_popular(count=20)
# for media in popular_media:
#     print media.images['standard_resolution'].url

recent_media, next = api.user_recent_media()
photos = []
for media in recent_media:
	# print media.images
	# retorna: {u'low_resolution': Image: http://distilleryimage11.s3.amazonaws.com/1eef448a823111e180d51231380fcd7e_6.jpg, 
	          # u'thumbnail': Image: http://distilleryimage11.s3.amazonaws.com/1eef448a823111e180d51231380fcd7e_5.jpg, 
	          # u'standard_resolution': Image: http://distilleryimage11.s3.amazonaws.com/1eef448a823111e180d51231380fcd7e_7.jpg}
	photos.append('<img src="%s"/>' % media.images['standard_resolution'].url)
# print photos