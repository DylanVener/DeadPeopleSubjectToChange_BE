from flask import Flask, request, jsonify
import bleach
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://dylan@localhost/test'
db = SQLAlchemy(app)

@app.route('/')
def main():
    return 'Hello, World!'

@app.route('/cape_search', methods=['GET'])
def cape_search():
    cape = request.args.get('c_name')

    search = Cape.query.filter_by(c_name=cape).all()

    return jsonify([x.as_dict() for x in search])

class Cape(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    p_name = db.Column(db.String(80))
    c_name = db.Column(db.String(80))

    def __repr__(self):
        return '<User %r>' % self.c_name

    def __init__(self, p_name, c_name):
        self.p_name = p_name
        self.c_name = c_name

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}



if __name__ == "__main__":
    app.run(host='0.0.0.0')
