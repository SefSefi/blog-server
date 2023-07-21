import json
from flask import jsonify, abort, make_response
from database import db


def get_all_posts():
    query = '''
        SELECT u.username, p.id, p.title, p.body, p.category_id, p.created_at
        FROM post as p
        JOIN user as u
        ON p.user_id=u.id
        LIMIT 100
    '''

    cursor = db.connection.cursor()
    cursor.execute(query, )
    records = cursor.fetchall()
    cursor.close()
    header = ['username', 'id', 'title', 'body', 'category_id', 'created_at']
    data = []
    for r in records:
        valid_r = (r[0], r[1], r[2], r[3], r[4], r[5].strftime('%Y-%m-%d %H:%M:%S'))
        data.append(dict(zip(header, valid_r)))

    return json.dumps(data)


def add_new_post(data, user_id):
    # print("add new post")
    # print("data: ", data)
    query = "INSERT INTO post (title, body, user_id, category_id) values (%s, %s, %s, %s)"
    values = (data['title'], data['body'], user_id, data['category'])
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


def override_post(data, user_id):
    print("override post")
    print("data: ", data)
    query = "UPDATE post SET title=%s, body=%s, category_id=%s WHERE id=%s AND user_id=%s"
    values = (data['title'], data['body'], data['category'], data['post_id'], user_id)
    cursor = db.connection.cursor()
    cursor.execute(query, values)
    db.connection.commit()
    cursor.close()

    if cursor.rowcount == 0:
        abort(401)

    else:
        response = {
            'status': 'success',
            'message': 'Post created successfully',
            'post_id': cursor.lastrowid
        }
        return jsonify(response), 201


def delete_the_post(data, user_id):
    print("delete post")
    print("data: ", data)
    query = "DELETE FROM post WHERE id=%s AND user_id=%s"
    values = (data['post_id'], user_id)
    cursor = db.connection.cursor()
    cursor.execute(query, values)
    db.connection.commit()
    cursor.close()

    if cursor.rowcount == 0:
        abort(401)

    else:
        response = {
            'status': 'success',
            'message': 'you deleted the post',
            # 'post_id': cursor.lastrowid
        }
        return jsonify(response), 201


def get_categories():
    query = 'SELECT * from category'
    cursor = db.connection.cursor()
    cursor.execute(query, )
    categories = cursor.fetchall()
    cursor.close()

    data = []
    header = ['id', 'name']

    for r in categories:
        data.append(dict(zip(header, r)))

    return json.dumps(data)
