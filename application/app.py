import os
from flask import Flask
from flask import send_from_directory

app = Flask(__name__)


# add a route for / as the root of the application
@app.route('/', methods=['GET'])
def getRoot():
    return "<h1>profile API</h1><p>This API is a prototype API for demo purposes only </p>"


# add a route for /favicon.ico located in ./static/ to ensure we do not have a 404 on favicon.
@app.route('/favicon.ico', methods=['GET'])
def getRootIcon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')


# add a route for /documentation as the documentation root
@app.route('/documentation', methods=['GET'])
def getRootDocumentation():
    return "<h1>Documentation home</h1><p>This API is a prototype API for demo purposes only </p>"


# add a route for /api as the API root
@app.route('/api', methods=['GET'])
def getRootApi():
    return "<h1>API home</h1><p>This API is a prototype API for demo purposes only </p>"


# add a route for /api/v1.0 as the root for API version 1.0
@app.route('/api/v1.0', methods=['GET'])
def getRootApiV10():
    return "<h1>API version 1.0</h1><p>This API is a prototype API for demo purposes only </p>"


if __name__ == "__main__":
    app.run()