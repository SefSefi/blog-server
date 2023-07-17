from flask import Flask, request, abort
from database import db
from PostController import get_all_posts, add_new_post, get_categories
from userController import add_new_user, user_log_in, session_validator, clear_session
from flask_cors import CORS
import uuid

app = Flask(__name__)
CORS(app, supports_credentials=True, origins=["http://localhost:3000", "http://127.0.0.1:5000"],
     expose_headers='Set-Cookie')
db.connect()


@app.route('/posts', methods=['GET', 'POST'])
def manage_posts():
    if request.method == 'GET':
        return get_all_posts()
    else:
        user_id = session_validator()
        print("chacking", request.get_json())
        return add_new_post(request.get_json(), user_id)

@app.route('/signup', methods=['POST'])
def manage_sign_up():
    return add_new_user(request.get_json())


@app.route('/login', methods=['POST'])
def manage_log_in():
    return user_log_in(request.get_json())


@app.route('/logout', methods=['POST'])
def logout():
    user_id = session_validator()
    return clear_session(user_id)

@app.route('/category', methods=['get'])
def category():
    return get_categories()


if __name__ == "__main__":
    app.run()
