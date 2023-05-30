from flask import Flask, request
from database import db
from PostController import get_all_posts, add_new_post
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})
db.connect()


@app.route('/post', methods=['GET', 'POST'])
def manage_posts():
    if request.method == 'GET':
        return get_all_posts()
    else:
        return add_new_post(request.get_json())


if __name__ == "__main__":
    app.run()
