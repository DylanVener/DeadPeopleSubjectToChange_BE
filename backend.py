from flask import Flask, request, jsonify
import bleach
from flask.ext.mysql import MySQL
from flask_cors import CORS, cross_origin
from pymysql.cursors import DictCursor


mysql = MySQL(cursorclass=DictCursor)

app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'dylan'
app.config['MYSQL_DATABASE_PASSWORD'] = 'pass'
app.config['MYSQL_DATABASE_DB'] = 'test'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()

CORS(app)

@app.route('/')
def main():
    return 'Hello, World!'

@cross_origin()
@app.route('/cape_search', methods=['GET'])
def cape_search():
    cape = bleach.clean(request.args.get('c_name'))
    cursor.callproc('sp_searchCapes',[cape])
    ret = cursor.fetchall()

    return ret

