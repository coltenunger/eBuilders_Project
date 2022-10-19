from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Managers(db.Model):
    __tablename__ = "managers"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    title = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    birth_date = db.Column(db.Date, nullable=False)

    def __init__(self, first_name, last_name, title, email, phone, birth_date):
        self.first_name = first_name
        self.last_name = last_name
        self.title = title
        self.email = email
        self.phone = phone
        self.birth_date = birth_date


class Projects(db.Model):
    __tablename__ = "projects"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    address = db.Column(db.Text, nullable=False)
    county = db.Column(db.Text, nullable=False)
    city = db.Column(db.Text, nullable=False)
    project_desc = db.Column(db.Text, nullable=False)
    start_date = db.Column(db.Date, nullable=False)
    end_date = db.Column(db.Date, nullable=True)
    start_budget = db.Column(db.Text, nullable=False)
    end_budget = db.Column(db.Text, nullable=True)
    lot_num = db.Column(db.String(3), nullable=True)
    lockbx_code = db.Column(db.String(4), nullable=True)
    dumpster_drop = db.Column(db.Text, nullable=True)
    portajohn_srv_day = db.Column(db.Text, nullable=True)
    manager_id = db.Column(db.Integer, db.ForeignKey("managers.id"), nullable=False)
    client_id = db.Column(db.Integer, db.ForeignKey("clients.id"), nullable=False)
    manager = db.relationship("Managers", backref="projects", cascade="all,delete")
    client = db.relationship("Clients", backref="projects", cascade="all,delete")


class Clients(db.Model):
    __tablename__ = "clients"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=True)
    phone = db.Column(db.String(12), nullable=False)
