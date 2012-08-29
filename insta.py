#! -*- encoding: utf8 -*-
from instagram.client import InstagramAPI

# access_token="(u'36006801.53b9019.7492fdf5495c4b08ab8cbfe6906c6735', {u'username': u'sberlotto', u'bio': u'Programador, geek, casado com a Danny, pai do Arthur.', u'website': u'http://berlotto.net', u'profile_picture': u'http://images.instagram.com/profiles/profile_36006801_75sq_1333967270.jpg', u'full_name': u'S\xe9rgio Berlotto Jr', u'id': u'36006801'})"
# Este access_token foi buscado através do script get_access_token
access_token="36006801.53b9019.7492fdf5495c4b08ab8cbfe6906c6735"

api = InstagramAPI(access_token=access_token)
# api = InstagramAPI(client_id='53b901915a6a4e8a83fc321e4f71eb56', client_secret='5a8ca1ec94bb4aba944dc4cdfb3e633d')
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