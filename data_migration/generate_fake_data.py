from faker import Faker
import psycopg2
import random

# Initialize Faker
fake = Faker()

# Database connection parameters
DB_HOST = 'localhost'
DB_NAME = 'your_database'
DB_USER = 'your_username'
DB_PASSWORD = 'your_password'

# Connect to PostgreSQL database
def connect_db():
    return psycopg2.connect(
        host=DB_HOST,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

# Create fake data for User table
def create_users(cursor, num_users):
    for _ in range(num_users):
        cursor.execute("""
            INSERT INTO "User" (username, email, photos, bio, date_of_birth, gender, sexual_orientation, interests, location_latitude, location_longitude, location_city, location_country, occupation, height, education_level)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            fake.user_name(),
            fake.email(),
            [fake.image_url() for _ in range(random.randint(1, 5))],
            fake.text(max_nb_chars=200),
            fake.date_of_birth(minimum_age=18, maximum_age=70),
            fake.random_element(elements=('Male', 'Female', 'Non-binary')),
            fake.random_element(elements=('Heterosexual', 'Homosexual', 'Bisexual')),
            [fake.word() for _ in range(random.randint(1, 5))],
            fake.latitude(),
            fake.longitude(),
            fake.city(),
            fake.country(),
            fake.job(),
            random.randint(150, 200),
            fake.random_element(elements=('High School', 'Bachelor\'s Degree', 'Master\'s Degree', 'PhD'))
        ))

# Create fake data for DateProposition table
def create_date_propositions(cursor, num_propositions, user_ids):
    for _ in range(num_propositions):
        cursor.execute("""
            INSERT INTO DateProposition (description, price, icon_url, sender_id, recipient_id)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            fake.text(max_nb_chars=100),
            round(random.uniform(10.0, 100.0), 2),
            fake.image_url(),
            random.choice(user_ids),
            random.choice(user_ids)
        ))

# Create fake data for Message table
def create_messages(cursor, num_messages, user_ids):
    for _ in range(num_messages):
        cursor.execute("""
            INSERT INTO Message (sender_id, receiver_id, message, timestamp)
            VALUES (%s, %s, %s, %s)
        """, (
            random.choice(user_ids),
            random.choice(user_ids),
            fake.text(max_nb_chars=200),
            fake.date_time_this_year()
        ))

# Create fake data for Discussion table
def create_discussions(cursor, num_discussions, user_ids):
    for _ in range(num_discussions):
        cursor.execute("""
            INSERT INTO Discussion (title, current_user_id, other_user_id, timestamp, last_message)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            fake.sentence(nb_words=6),
            random.choice(user_ids),
            random.choice(user_ids),
            fake.date_time_this_year(),
            fake.text(max_nb_chars=200)
        ))

# Create fake data for Session table
def create_sessions(cursor, num_sessions, user_ids):
    for _ in range(num_sessions):
        cursor.execute("""
            INSERT INTO Session (user_id, session_token, created_at, expires_at)
            VALUES (%s, %s, %s, %s)
        """, (
            random.choice(user_ids),
            fake.uuid4(),
            fake.date_time_this_year(),
            fake.date_time_this_year(end_date='+30d')
        ))

def main():
    conn = connect_db()
    cursor = conn.cursor()

    try:
        # Number of fake records to generate
        num_users = 50
        num_propositions = 30
        num_messages = 100
        num_discussions = 20
        num_sessions = 50

        # Create fake data
        create_users(cursor, num_users)

        # Get all user IDs to use in other tables
        cursor.execute("SELECT id FROM \"User\"")
        user_ids = [row[0] for row in cursor.fetchall()]

        create_date_propositions(cursor, num_propositions, user_ids)
        create_messages(cursor, num_messages, user_ids)
        create_discussions(cursor, num_discussions, user_ids)
        create_sessions(cursor, num_sessions, user_ids)

        # Commit the transaction
        conn.commit()
    except Exception as e:
        print(f"Error: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
