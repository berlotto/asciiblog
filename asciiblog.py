# -*- encoding: utf-8 -*-

from flask import Flask, render_template

#Blueprint Applications
from blog import blog

app = Flask(__name__)
app.debug = True

app.register_blueprint(blog, url_prefix='/blog')

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0')