import os
from flask import Flask
from flask_migrate import Migrate
from .models import Managers, Projects, Clients, db

# https://flask.palletsprojects.com/en/2.0.x/patterns/appfactories/


def drop_tables():
    # Drop all rows from database tables
    Projects.__table__.drop(db.engine)
    Managers.__table__.drop(db.engine)
    Clients.__table__.drop(db.engine)
    db.session.commit()


# INSERTING DATA
def insert_data(db):
    from .models import Clients, Managers, Projects

    # INSERTING PROJECT 1
    project1 = Projects(
        "652 Corkery Ct",
        "Williamson",
        "Brentwood",
        "Ext porch add",
        "2022-07-07",
        "2022-12-07",
        "$280,355",
        "$295,677",
        "022",
        "6872",
        "5th day of mo",
        "Thursday",
    )
    client1 = Clients("Elizabeth", "Galbraith", "lizbeth0458@gmail.com", "615-512-8776")
    manager1 = Managers(
        "Brian",
        "Unger",
        "President",
        "brianunger@mac.com",
        "615-416-0433",
        "1969-03-12",
    )

    client1.projects.append(project1)
    manager1.projects.append(project1)
    db.session.add(client1)
    db.session.add(manager1)
    db.session.add(project1)

    # INSERTING PROJECT 2 & 3
    project2 = Projects(
        "8887 Devan Square",
        "Williamson",
        "Franklin unincorporated",
        "Ext kitchen/living space/patio",
        "2021-12-06",
        "2022-11-23",
        "$192,039",
        "$420000",
        None,
        "5910",
        "5th day of the month",
        "Friday",
    )
    project3 = Projects(
        "8887 Devan Square",
        "Williamson",
        "Franklin unincorporated",
        "Dual simultaneous bath remodels",
        "2022-02-03",
        "2022-08-17",
        "$147,581",
        "$159,376",
        None,
        "5910",
        "5th day of the month",
        "Friday",
    )
    client2 = Clients(
        "Candice", "Thatcher", "candicethatcher@mybiz.net", "615-225-9057"
    )
    manager2 = Managers(
        "Josh",
        "Fedorka",
        "Project Manager",
        "joshfedorka@eBuilders.com",
        "615-578-2346",
        "1973-06-24",
    )
    client2.projects.append(project2)
    client2.projects.append(project3)
    manager2.projects.append(project2)
    manager2.projects.append(project3)
    db.session.add(client2)
    db.session.add(manager2)
    db.session.add(project2)
    db.session.add(project3)

    # INSERTING PROJECT 4
    project4 = Projects(
        "307 Beatty Crossing",
        "Williamson",
        "Brentwood",
        "Int remodel, Ext pool/patio",
        "2022-06-07",
        "2022-01-07",
        "$672,804",
        "$775,000",
        "015",
        "2168",
        "5th day of the month",
        "Thursday",
    )
    client3 = Clients("Craig", "Brushwick", "doctorcraig@icloud.com", "615-758-7483")
    manager3 = Managers(
        "Conor",
        "McAskill",
        "Assistant Project Manager",
        "conormcaskill@gmail.com",
        "303-870-9642",
        "1995-11-21",
    )
    client3.projects.append(project4)
    manager3.projects.append(project4)
    db.session.add(client3)
    db.session.add(manager3)
    db.session.add(project4)

    # INSERTING PROJECT 5
    project5 = Projects(
        "3133 Cartwright Springs",
        "Williamson",
        "Franklin unincorporated",
        "Kitchen/miscellaneous remodeling",
        "2022-01-11",
        None,
        "$103,614",
        None,
        "011",
        "1874",
        "3rd day of the month",
        "Thursday",
    )
    client4 = Clients("Anil", "Sharma", "asharma07@itcpublic.org", "615-225-9057")
    client4.projects.append(project5)
    manager1.projects.append(project5)
    db.session.add(client4)
    db.session.add(project5)

    # INSERTING PROJECT 6
    project6 = Projects(
        "7330 Collins Road",
        "Williamson",
        "Franklin",
        "Full house remodel",
        "2021-07-05",
        "2022-10-28",
        "$522,109",
        "$877,674",
        "007",
        "6204",
        "3rd day of the month",
        "Friday",
    )
    client5 = Clients("Betty", "Jones", "jones112betty@yahoo.com", "312-656-0715")
    client5.projects.append(project6)
    manager2.projects.append(project6)
    db.session.add(client5)
    db.session.add(project6)

    # INSERTING PROJECT 7
    project7 = Projects(
        "697 Douglas Way",
        "Williamson",
        "Brentwood",
        "Full house remodel",
        "2021-06-21",
        "2022-08-17",
        "$284,312",
        "$378,812",
        "029",
        "7183",
        "3rd day of the month",
        "Monday",
    )
    client6 = Clients("Rachael", "Tamang", "rachaelthetamang@gmail.com", "408-246-3210")
    client6.projects.append(project7)
    manager1.projects.append(project7)
    db.session.add(client6)
    db.session.add(project7)

    # INSERTING PROJECT 8
    project8 = Projects(
        "7751 Hilbert Park ",
        "Williamson",
        "Brentwood",
        "2nd floor remodel (2 bath)",
        "2022-08-02",
        None,
        "$234,164",
        None,
        "067",
        "9427",
        "1st day of the month",
        "Thursday",
    )
    client7 = Clients("Mark", "Zhang", "markz@iqinc.com", "615-758-8231")
    client7.projects.append(project8)
    manager3.projects.append(project8)
    db.session.add(client7)
    db.session.add(project8)

    # INSERTING PROJECT 9
    project9 = Projects(
        "8218 Cyrus Ridge",
        "Davidson",
        "Forest Hills",
        "Ext/Int full house remodel",
        "2022-06-27",
        "2023-06-27",
        "$620,511",
        "$865,065",
        "038",
        "1783",
        "5th day of the month",
        "Monday",
    )
    client8 = Clients("Chris", "Port", "chriswport@hotmail.com", "615-079-2244")
    client8.projects.append(project9)
    manager2.projects.append(project9)
    db.session.add(client8)
    db.session.add(project9)

    db.session.commit()


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY="dev",
        SQLALCHEMY_DATABASE_URI="postgresql://postgres@localhost:5432/ebuilders",
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
        SQLALCHEMY_ECHO=True,
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile("config.py", silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from .models import db
    from .api import clients, managers, projects

    app.register_blueprint(clients.bp)
    app.register_blueprint(managers.bp)
    app.register_blueprint(projects.bp)

    with app.app_context():
        db.init_app(app)
        drop_tables()
        db.create_all()
        migrate = Migrate(app, db)
        insert_data(db)

    return app
