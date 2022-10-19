import os
from flask import Flask
from flask_migrate import Migrate

# https://flask.palletsprojects.com/en/2.0.x/patterns/appfactories/


def insert_dummy_data(db):
    from .models import Managers

    manager1 = Managers(
        "Jack", "Borrow", "Job Manager", "Jack@gmail.com", "1234752", "1999/06/02"
    )
    db.session.add(manager1)
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

    with app.app_context():
        db.init_app(app)
        # db.create_all()
        migrate = Migrate(app, db)
        insert_dummy_data(db)

    # from .api import users, tweets
    # app.register_blueprint(users.bp)
    # app.register_blueprint(tweets.bp)

    return app
