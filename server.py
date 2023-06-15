from flask import Flask, request
from database import db
from PostController import get_all_posts, add_new_post
from userController import add_new_user, user_log_in
from flask_cors import CORS
import uuid

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})
db.connect()


@app.route('/post', methods=['GET', 'POST'])
def manage_posts():
    if request.method == 'GET':
        return get_all_posts()
    else:
        return add_new_post(request.get_json())


@app.route('/signup', methods=['POST'])
def manage_sign_up():
    return add_new_user(request.get_json())


@app.route('/login', methods=['POST'])
def manage_log_in():
    return user_log_in(request.get_json())


if __name__ == "__main__":
    app.run()
