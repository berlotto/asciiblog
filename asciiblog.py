# -*- encoding: utf-8 -*-

from flask import Flask, render_template, request, jsonify
import markdown

#Blueprint Applications
from blog import blog

#========================================= CONFIGURATION
app = Flask(__name__)
app.config.from_pyfile('asciiblog.cfg')

#========================================= UPLOADS
from flaskext.uploads import UploadSet, configure_uploads, IMAGES, UploadNotAllowed

uploaded_files = UploadSet('postfile')
configure_uploads(app, uploaded_files)

#========================================= BLUEPRINTS APPS
app.register_blueprint(blog, url_prefix='/blog')
blog.register_uploader(uploaded_files)

#========================================= CUSTOM FILTERS FOR JINJA
from jinja2 import evalcontextfilter, Markup, escape

@app.template_filter()
@evalcontextfilter
def translate_markdown(env, texto):
	"""
	Method that translate from Markdown to HTML, for show in templates
	"""
	html = markdown.markdown(texto)
	if env.autoescape:
		html = Markup(html)
	return html

#========================================= MAIN ROUTES
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/slugfy/')
def slugfy():
	from slugfy import slug
	text = request.args['text']
	return jsonify(slug=slug(text))


#========================================= MAIN APP
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
