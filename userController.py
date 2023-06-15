from flask import Flask, jsonify, request, abort, make_response
from settings import dbpwd
from database import db
import mysql.connector as mysql
import uuid
import json
import bcrypt


def add_new_user(data):
    print("data sign up: ", data)
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
    print("data log in: ", data)
    query = "select id, username, password from user where username = %s"
    values = (data['username'],)
    cursor = db.connection.cursor()
    print("befor ex: ")

    cursor.execute(query, values)
    print("after ex: ")

    user = cursor.fetchone()



    if not user:
        abort(401)

    user_id = user[0]
    hashed_pwd = user[2]

    if not bcrypt.checkpw((data['password']).encode('utf-8'), hashed_pwd.encode('utf-8')):
        abort(401)

    query = "insert into session (user_id, session_id) values(%s, %s)"
    session_id = str(uuid.uuid4())
    values = (user_id, session_id)
    cursor.execute(query, values)
    cursor.close()
    resp = make_response()
    resp.set_cookie("session_id", session_id)
    return resp
