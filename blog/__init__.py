from flask import Blueprint, render_template, abort

blog = Blueprint('blog', __name__, template_folder='templates', static_folder='static')

@blog.route('/')
def blog_index():
    return render_template('index.html')

@blog.route('/new-post')
def new_post():
	return render_template('new-post.html')
