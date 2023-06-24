import json
from flask import jsonify
from database import db


def get_all_posts():
    query = '''
        SELECT u.username, p.id, p.title, p.body, p.created_at
        FROM post as p
        JOIN user as u
        ON p.user_id=u.id
    '''

    cursor = db.connection.cursor()
    cursor.execute(query)
    records = cursor.fetchall()
    cursor.close()
    header = ['username', 'id', 'title', 'body', 'created_at']
    data = []
    for r in records:
        valid_r = (r[0], r[1], r[2], r[3], r[4].strftime('%Y-%m-%d %H:%M:%S'))
        data.append(dict(zip(header, valid_r)))

    print("finished data: ", records)
    return json.dumps(data)


def add_new_post(data, user_id):
    print("data: ", data)
    query = "INSERT INTO post (title, body, user_id) values (%s, %s, %s)"
    values = (data['title'], data['body'], user_id)
    cursor = db.connection.cursor()
    cursor.execute(query, values)
    db.connection.commit()

    response = {
        'status': 'success',
        'message': 'Post created successfully',
        'post_id': cursor.lastrowid
    }
    cursor.close()
    return jsonify(response), 201

