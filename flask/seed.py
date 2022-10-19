"""
Populate eBuilders database with fake data using the SQLAlchemy ORM.
"""

import random
import string
import hashlib
import secrets
from faker import Faker
from eBuilders.src.models import Managers, Projects, Clients, db
from eBuilders.src import create_app

MANAGER_COUNT = 5
TWEET_COUNT = 100
LIKE_COUNT = 400


# def random_passhash():
#     """Get hashed and salted password of length N | 8 <= N <= 15"""
#     raw = "".join(
#         random.choices(
#             string.ascii_letters + string.digits + "!@#$%&",  # valid pw characters
#             k=random.randint(8, 15),  # length of pw
#         )
#     )

#     salt = secrets.token_hex(16)

#     return hashlib.sha512((raw + salt).encode("utf-8")).hexdigest()


def truncate_tables():
    """Delete all rows from database tables"""
    # db.session.execute(likes_table.delete())
    Managers.query.delete()
    # Twitter.query.delete()
    db.session.commit()


def main():
    """Main driver function"""
    app = create_app()
    app.app_context().push()
    truncate_tables()
    fake = Faker()

    for _ in range(MANAGER_COUNT):
        last_manager = Managers(
            first_name=fake.unique.first_name().lower(),
            last_name=fake.unique.first_name().lower(),
            title=fake.job(),
            email=fake.email(),
            phone="408-235-2343",
            birth_date=fake.date(),
        )
        db.session.add(last_manager)

    # insert managers
    db.session.commit()

    # last_tweet = None  # save last tweet
    # for _ in range(TWEET_COUNT):
    #     last_tweet = Tweet(
    #         content=fake.sentence(),
    #         user_id=random.randint(last_user.id - USER_COUNT + 1, last_user.id),
    #     )
    #     db.session.add(last_tweet)

    # # insert tweets
    # db.session.commit()

    # user_tweet_pairs = set()
    # while len(user_tweet_pairs) < LIKE_COUNT:

    #     candidate = (
    #         random.randint(last_user.id - USER_COUNT + 1, last_user.id),
    #         random.randint(last_tweet.id - TWEET_COUNT + 1, last_tweet.id),
    #     )

    #     if candidate in user_tweet_pairs:
    #         continue  # pairs must be unique

    #     user_tweet_pairs.add(candidate)

    # new_likes = [
    #     {"user_id": pair[0], "tweet_id": pair[1]} for pair in list(user_tweet_pairs)
    # ]
    # insert_likes_query = likes_table.insert().values(new_likes)
    # db.session.execute(insert_likes_query)

    # # insert likes
    # db.session.commit()


# run script
main()
