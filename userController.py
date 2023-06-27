from flask import Flask, session, jsonify, request, abort, make_response, redirect
from settings import dbpwd
from database import db
import mysql.connector as mysql
import uuid
import json
import bcrypt


def add_new_user(data):
    query = "INSERT INTO user (username, password) values (%s, %s)"
    values = (data['username'], bcrypt.hashpw(data['password'].encode('utf-8'), bcrypt.gensalt()))
    cursor = db.connection.cursor()
    cursor.execute(query, values)
    db.connection.commit()

    response = {
        'status': 'success',
        'message': 'User created successfully',
        'user_id': cursor.lastrowid
    }
    cursor.close()
    return jsonify(response), 201


def user_log_in(data):
    print("cookie on sign in: ", request.cookies.get('session_id'))

    query = "select id, username, password from user where username = %s"
    values = (data['username'],)
    cursor = db.connection.cursor()
    cursor.execute(query, values)
    user = cursor.fetchone()

    if not user:
        abort(401)

    user_id = user[0]
    hashed_pwd = user[2]

    if not bcrypt.checkpw((data['password']).encode('utf-8'), hashed_pwd.encode('utf-8')):
        abort(401)
    print(user_id)
    session_id = str(uuid.uuid4())
    query = "insert into session (user_id, session_id) values(%s, %s)"
    values = (user_id, session_id)
    cursor.execute(query, values)
    db.connection.commit()
    cursor.close()

    resp = make_response("logged in successfully")
    resp.user_id = user_id
    resp.set_cookie("session_id", session_id, path="/", samesite='None', secure=True)
    return resp


def session_validator():
    cookie_value = request.cookies.get('session_id')
    print("cookie: ", cookie_value)
    if cookie_value:
        query = "select user_id from session where session_id = %s"
        values = (cookie_value,)
        cursor = db.connection.cursor()
        cursor.execute(query, values)
        user = cursor.fetchone()
        if not user:
            abort(401)
        user_id = user[0]

        if user_id:
            return user_id
        else:
            abort(401)


def clear_session(user_id):
    print("my user: ", user_id)

    if user_id:
        query = "DELETE FROM session WHERE user_id = %s"
        values = (user_id,)
        cursor = db.connection.cursor()
        cursor.execute(query, values)
        db.connection.commit()
        cursor.close()

    return make_response(" you log out ")
