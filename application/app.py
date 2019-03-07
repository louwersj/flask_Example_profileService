import os
from flask import Flask
from flask import send_from_directory

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')

#app.add_url_rule('/favicon.ico',
#                 redirect_to=url_for('static', filename='favicon.ico'))

if __name__ == "__main__":
    app.run()