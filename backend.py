from flask import Flask, request, jsonify
from bleach import clean
from flask.ext.mysql import MySQL
from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity
from flask_cors import CORS, cross_origin
from pymysql.cursors import DictCursor, escape_string


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
        cursor.callproc('UniverseUpdate',inputs)
    elif types == 'publisher':
        cursor.callproc('PublisherUpdate',inputs)
    elif types == 'series':
        cursor.callproc('SeriesUpdate',inputs)
    elif types == 'kills':
        cursor.callproc('KillsUpdate',inputs)
    elif types == 'charSeries':
        cursor.callproc('CharSeriesUpdate',inputs)
    elif types == 'rating':
        cursor.callproc('RatingsUpdate',inputs)
    ret = cursor.fetchall()
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
        cursor.callproc('KillsDelete',inputs)
    elif types == 'charSeries':
        cursor.callproc('CharSeriesDelete',inputs)
    elif types == 'rating':
        cursor.callproc('RatingsDelete',inputs)
    ret = cursor.fetchall()
    cursor.close()
    con.close()
    return jsonify(ret), 200

@cross_origin()
@app.route('/search', methods=['GET'])
def search():
    con = mysql.connect()
    cursor = con.cursor()
    inputs = clean(request.args.get('name'))
    types = clean(request.args.get('type'))
    if types == 'cape':
        cursor.callproc('sp_searchCapes',[inputs])
    elif types == 'universe':
        cursor.callproc('sp_searchUniverse',[inputs])
    elif types == 'publisher':
        cursor.callproc('sp_searchPublisher',[inputs])
    elif types == 'series':
        cursor.callproc('sp_searchSeries',[inputs])
    elif types == 'kills':
        cursor.callproc('sp_searchKills',[inputs])
    elif types == 'charSeries':
        cursor.callproc('sp_searchCharSeries',[inputs])
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
    returned = list(cursor.fetchone().keys())[0]

    if returned == '500':
        ret = {'access_token' : create_access_token(identity=username)}
        return jsonify(ret), 200
    else:
        return jsonify({'failure' : 'Failed to Login'}), 401

if __name__ == "__main__":
    app.run(host='0.0.0.0')
