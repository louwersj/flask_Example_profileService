import os
from flask import Flask
from flask import send_from_directory

app = Flask(__name__)


# add a route for / as the root of the application
@app.route("/")
def hello():
    return "Hello World!"


# add a route for /favicon.ico located in ./static/ to ensure we do not have a 404 on favicon.
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')



if __name__ == "__main__":
    app.run()