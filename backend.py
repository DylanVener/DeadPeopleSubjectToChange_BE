from flask import Flask, request, jsonify
import bleach
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS, cross_origin



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://dylan@localhost/test'
CORS(app)
db = SQLAlchemy(app)

@app.route('/')
def main():
    return 'Hello, World!'

@cross_origin()
@app.route('/cape_search', methods=['GET'])
def cape_search():
    cape = request.args.get('c_name')

    search = Cape.query.filter_by(c_name=cape).all()

    return jsonify([x.as_dict() for x in search])


class Cape(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    p_name = db.Column(db.String(30))
    c_name = db.Column(db.String(30))
    publisher = db.Column(db.String(30), db.ForeignKey('Publisher.name'))
    universe = db.Column(db.String(30), db.ForeignKey('Universe.name'))

    def __repr__(self):
        return '<User %r>' % self.c_name

    def __init__(self, p_name, c_name):
        self.p_name = p_name
        self.c_name = c_name

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

class KilledBy(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    killee = db.column(db.String(30), db.ForeignKey('Cape.id'))
    killer = db.column(db.String(30), db.ForeignKey('Cape.id'))
    description = db.Column(db.String(300))
    IssueNum = db.Column(db.Integer(30))


class Publisher(db.Model):
    name = db.Column(db.String(30), primary_key = True)
    h_name = db.Column(db.String(300))

    def __repr__(self):
        return '<Publisher %s>' % self.name

    def __init__(self, name, h_name):
        self.name = name
        self.h_name = h_name

class Universe(db.Model):
    name = db.Column(db.String(30))
    size = db.Column(db.String(30))
    publisher = db.Column(db.String(30), db.ForeignKey('Publisher.name')




if __name__ == "__main__":
    app.run(host='0.0.0.0')
