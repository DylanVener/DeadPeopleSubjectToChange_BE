from flask import Flask, request, jsonify
import bleach
from flask.ext.mysql import MySQL
from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity
from flask_cors import CORS, cross_origin
from pymysql.cursors import DictCursor


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
@app.route('/search', methods=['GET'])
def cape_search():
    con = mysql.connect()
    cursor = con.cursor()
    inputs = bleach.clean(request.args.get('name'))
    types = bleach.clean(request.args.get('type'))
    if types == 'cape':
        cursor.callproc('sp_searchCapes',[inputs])
    elif types == 'universe':
        cursor.callproc('sp_searchUniverse',[inputs])
    elif types == 'publisher':
        cursor.callproc('sp_searchPublisher',[inputs])
    elif types == 'series':
        cursor.callproc('sp_searchSeries',[inputs])
    ret = cursor.fetchall()
    print(ret)
    cursor.close()
    con.close()
    return jsonify(ret), 200

@cross_origin()
@app.route('/createUser', methods=['POST'])
def createUser():
    con = mysql.connect()
    cursor = con.cursor()
    data = request.get_json()
    username  = bleach.clean(data['username'])
    password =  bleach.clean(data['password'])
    cursor.callproc('UserCreate', [username,password])
    returned = list(cursor.fetchone().keys())[0]
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
    username  = bleach.clean(data['username'])
    password =  bleach.clean(data['password'])
    cursor.callproc('UserLogin', [username,password])
    returned = list(cursor.fetchone().keys())[0]

    if returned == '500':
        ret = {'access_token' : create_access_token(identity=username)}
        return jsonify(ret), 200
    else:
        return jsonify({'failure' : 'Failed to Login'}), 401

if __name__ == "__main__":
    app.run(host='0.0.0.0')
