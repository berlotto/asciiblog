from flask import Blueprint, render_template, abort

blog = Blueprint('blog', __name__)

@blog.route('/')
def blog_indes(page):
    return render_template('blog_index.html')
