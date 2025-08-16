# C P R G 2 5 0    P R O J E C T  2 #
# PHASE TWO: DATABASE IMPLEMENTATION
# Purpose: data population for VOD database
# Author: JH

# pip install psycopg2

import psycopg2

# Connect to PostgreSQL
conn = psycopg2.connect(
    "host=localhost dbname=vod user=postgres password=admin port=5432"
)
cur = conn.cursor()

# TRUNCATE TABLES FIRST (child tables first)
truncate_sql = """
TRUNCATE TABLE wishlist, rental, actor_movie, director_movie, 
movie_advisory, movie_category, movie, advisory, actor, director, 
customer, category RESTART IDENTITY CASCADE;
"""
cur.execute(truncate_sql)
conn.commit()
print("All tables truncated and IDs reset.")

# PARENT TABLES
parent_tables = {
    'DataBridges/Customer.csv': 'customer',
    'DataBridges/Actor.csv': 'actor',
    'DataBridges/Director.csv': 'director',
    'DataBridges/Movie.csv': 'movie',
    'DataBridges/Category.csv': 'category',
    'DataBridges/Advisory.csv': 'advisory'
}

for path, table in parent_tables.items():
    copy_sql = f"""
        COPY {table} FROM stdin
        WITH CSV HEADER
        NULL 'NULL'
    """
    with open(path, 'r') as f:
        cur.copy_expert(sql=copy_sql, file=f)
    conn.commit()
    print(f"Populated {table} from {path}")

# CHILD TABLES / Data Bridges
child_tables = {
    'DataBridges/MovieCategory.csv': 'movie_category',
    'DataBridges/MovieAdvisory.csv': 'movie_advisory',
    'DataBridges/Rental.csv': 'rental',
    'DataBridges/Wishlist.csv': 'wishlist',
    'DataBridges/ActorMovie.csv': 'actor_movie',
    'DataBridges/DirectorMovie.csv': 'director_movie'
}

for path, table in child_tables.items():
    copy_sql = f"""
        COPY {table} FROM stdin
        WITH CSV HEADER
        NULL 'NULL'
    """
    with open(path, 'r') as f:
        cur.copy_expert(sql=copy_sql, file=f)
    conn.commit()
    print(f"Populated {table} from {path}")

# Close connection
conn.close()
print("Database population complete!")
