from flask import Flask, request, jsonify
from bleach import clean
from flask.ext.mysql import MySQL
from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity
from flask_cors import *
from pymysql.cursors import DictCursor
from pymysql import escape_string


mysql = MySQL(cursorclass=DictCursor)

app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'dylan'
app.config['MYSQL_DATABASE_PASSWORD'] = 'pass'
app.config['MYSQL_DATABASE_DB'] = 'test'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

app.debug = True
app.secret_key = 'secretBATMAN123'
jwt = JWTManager(app)

CORS(app)

from datetime import timedelta
from flask import make_response, request, current_app
from functools import update_wrapper


def crossdomain(origin=None, methods=None, headers=None,
                max_age=21600, attach_to_all=True,
                automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers, list):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, list):
        origin = ', '.join(origin)
    if isinstance(max_age, timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and request.method == 'OPTIONS':
                resp = current_app.make_default_options_response()
            else:
                resp = make_response(f(*args, **kwargs))
            if not attach_to_all and request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return update_wrapper(wrapped_function, f)
    return decorator

@app.route('/')
def main():
    return 'Hello, World!'

@cross_origin()
@app.route('/create', methods=['GET'])
def create():
    con = mysql.connect()
    cursor = con.cursor()

    username = get_jwt_identity()
    cursor.callproc('sp_validate',[username])
    userType = list(cursor.fetchone().keys())[0]
    if userType != 'admin':
        return jsonify({'failure':'Incorrect Permissions'}), 401

    data = request.get_json()

    inputs = list(map(lambda x : escape_string(clean(x)), data.values()))
    types = clean(data.pop('type',None))
    if types == 'cape':
        cursor.callproc('CharacterCreate',inputs)
    elif types == 'universe':
        cursor.callproc('UniverseCreate',inputs)
    elif types == 'publisher':
        cursor.callproc('PublisherCreate',inputs)
    elif types == 'series':
        cursor.callproc('SeriesCreate',inputs)
    elif types == 'kills':
        cursor.callproc('KillsCreate',inputs)
    elif types == 'charSeries':
        cursor.callproc('CharSeriesCreate',inputs)
    elif types == 'rating':
        cursor.callproc('RatingsCreate',inputs)
    ret = cursor.fetchall()
    con.commit()
    cursor.close()
    con.close()
    return jsonify(ret), 200


@cross_origin()
@app.route('/update', methods=['GET'])
def update():
    con = mysql.connect()
    cursor = con.cursor()

    username = get_jwt_identity()
    cursor.callproc('sp_validate',[username])
    userType = list(cursor.fetchone().keys())[0]
    if userType != 'admin':
        return jsonify({'failure':'Incorrect Permissions'}), 401

    data = request.get_json()

    inputs = list(map(lambda x : escape_string(clean(x)), data.values()))
    types = clean(data.pop('type',None))
    if types == 'cape':
        cursor.callproc('CharacterUpdate',inputs)
    elif types == 'universe':
        cursor.callproc('UniversesUpdate',inputs)
    elif types == 'publisher':
        cursor.callproc('PublishersUpdate',inputs)
    elif types == 'series':
        cursor.callproc('SeriesUpdate',inputs)
    elif types == 'kills':
        cursor.callproc('KillUpdate',inputs)
    elif types == 'charSeries':
        cursor.callproc('CharacterSeriesUpdate',inputs)
    elif types == 'rating':
        cursor.callproc('RatingsUpdate',inputs)
    ret = cursor.fetchall()
    con.commit()
    cursor.close()
    con.close()
    return jsonify(ret), 200


@cross_origin()
@app.route('/delete', methods=['GET'])
def delete():
    con = mysql.connect()
    cursor = con.cursor()

    username = get_jwt_identity()
    cursor.callproc('sp_validate',[username])
    userType = list(cursor.fetchone().keys())[0]
    if userType != 'admin':
        return jsonify({'failure':'Incorrect Permissions'}), 401

    data = request.get_json()

    inputs = list(map(lambda x : escape_string(clean(x)), data.values()))
    types = clean(data.pop('type',None))
    if types == 'cape':
        cursor.callproc('CharacterDelete',inputs)
    elif types == 'universe':
        cursor.callproc('UniverseDelete',inputs)
    elif types == 'publisher':
        cursor.callproc('PublisherDelete',inputs)
    elif types == 'series':
        cursor.callproc('SeriesDelete',inputs)
    elif types == 'kills':
        cursor.callproc('KillDelete',inputs)
    elif types == 'charSeries':
        cursor.callproc('CharacterSeriesDelete',inputs)
    elif types == 'rating':
        cursor.callproc('RatingDelete',inputs)
    ret = cursor.fetchall()
    con.commit()
    cursor.close()
    con.close()
    return jsonify(ret), 200



@cross_origin()
@crossdomain(origin='*')
@app.route('/search', methods=['GET'])
def search():
    con = mysql.connect()
    cursor = con.cursor()
    inputs = clean(request.args.get('name'))
    types = clean(request.args.get('type'))
    if types == 'cape':
        cursor.callproc('CapeSearch',[inputs])
    elif types == 'universe':
        cursor.callproc('UniverseSearch',[inputs])
    elif types == 'publisher':
        cursor.callproc('PublisherSearch',[inputs])
    elif types == 'series':
        cursor.callproc('SeriesSeach',[inputs])
    elif types == 'killsByVic':
        cursor.callproc('KillsSearchByKilledID',[inputs])
    elif types == 'killsByKiller':
        cursor.callproc('KillsSearchByKillerID',[inputs])
    elif types == 'charSeriesPub':
        cursor.callproc('csp',[inputs])
    elif types == 'charBySeries':
        cursor.callproc('SearchCharacterBySeries',[inputs])
    elif types == 'seriesByUniverse':
        cursor.callproc('SearchSeriesByUniverse',[inputs])
    elif types == 'seriesByPub':
        cursor.callproc('SearchSeriesByPublisher',[inputs])
    elif types == 'universeByPub':
        cursor.callproc('SearchUniverseByPublisher',[inputs])

    ret = cursor.fetchall()
    cursor.close()
    con.close()
    return jsonify(ret), 200

@cross_origin()
@app.route('/createUser', methods=['POST'])
def createUser():
    con = mysql.connect()
    cursor = con.cursor()
    data = request.get_json()
    username  = clean(data['username'])
    password =  clean(data['password'])
    cursor.callproc('UserCreate', [username,password])
    returned = list(cursor.fetchone().keys())[0]
    con.commit()
    cursor.close() 
    con.close() 
    if returned == '500':
        ret = {'access_token' : create_access_token(identity=username)}
        return jsonify(ret), 200
    else:
        return jsonify({'failure' : 'Failed to Create User'}), 409 

@cross_origin()
@app.route('/login', methods=['POST'])
def login():
    con = mysql.connect()
    cursor = con.cursor()
    data = request.get_json()
    username = clean(data['username'])
    password =  clean(data['password'])
    cursor.callproc('UserLogin', [username,password])
    returned = list(cursor.fetchone().values())[0]

    if returned != '401':
        ret = {'access_token' : create_access_token(identity=username), 'role':returned}
        return jsonify(ret), 200
    else:
        return jsonify({'failure' : 'Failed to Login'}), 401

if __name__ == "__main__":
    app.run(host='0.0.0.0')
