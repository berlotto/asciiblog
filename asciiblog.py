# -*- encoding: utf-8 -*-

from flask import Flask, render_template

#Blueprint Applications
from blog import blog

app = Flask(__name__)
app.config.from_pyfile('asciiblog.cfg')

app.register_blueprint(blog, url_prefix='/blog')

@app.route('/')
def index():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
