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
    projects = db.relationship(
        "Projects", backref="manager", lazy=True, cascade="all, delete-orphan"
    )

    def __init__(self, first_name, last_name, title, email, phone, birth_date):
        self.first_name = first_name
        self.last_name = last_name
        self.title = title
        self.email = email
        self.phone = phone
        self.birth_date = birth_date

    def serialize(self):
        return {
            "id": self.id,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "title": self.title,
            "email": self.email,
            "phone": self.phone,
            "birth_date": self.birth_date.isoformat(),
        }


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
    client_id = db.Column(db.Integer, db.ForeignKey("clients.id"), nullable=False)
    manager_id = db.Column(db.Integer, db.ForeignKey("managers.id"), nullable=False)

    def __init__(
        self,
        address,
        county,
        city,
        project_desc,
        start_date,
        end_date,
        start_budget,
        end_budget,
        lot_num,
        lockbox_code,
        dumpster_drop,
        portajohn_srv_day,
    ):
        self.address = address
        self.county = county
        self.city = city
        self.project_desc = project_desc
        self.start_date = start_date
        self.end_date = end_date
        self.start_budget = start_budget
        self.end_budget = end_budget
        self.lot_num = lot_num
        self.lockbx_code = lockbox_code
        self.dumpster_drop = dumpster_drop
        self.portajohn_srv_day = portajohn_srv_day


class Clients(db.Model):
    __tablename__ = "clients"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=True)
    phone = db.Column(db.String(12), nullable=False)
    projects = db.relationship(
        "Projects", backref="client", lazy=True, cascade="all, delete-orphan"
    )

    def __init__(self, first_name, last_name, email, phone):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone = phone
