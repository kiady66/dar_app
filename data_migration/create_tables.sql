-- Create the User table with embedded Location data
CREATE TABLE IF NOT EXISTS "User" (
    id SERIAL PRIMARY KEY, -- Auto-incrementing primary key
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    photos TEXT[], -- Array of URLs for profile pictures
    bio TEXT,
    date_of_birth DATE,
    gender BOOLEAN, -- TRUE for female, FALSE for male
    sexual_orientation VARCHAR(50),
    interests TEXT[], -- Array of interests
    location_latitude DECIMAL(9, 6),
    location_longitude DECIMAL(9, 6),
    location_city VARCHAR(255),
    location_country VARCHAR(255),
    occupation VARCHAR(255),
    height INTEGER,
    education_level VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the DateProposition table
CREATE TABLE IF NOT EXISTS DateProposition (
    id SERIAL PRIMARY KEY, -- Auto-incrementing primary key
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    icon_url VARCHAR(255) NOT NULL,
    sender_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    recipient_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE
);

-- Create the Message table
CREATE TABLE IF NOT EXISTS Message (
    id SERIAL PRIMARY KEY, -- Auto-incrementing primary key
    sender_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    receiver_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Discussion table
CREATE TABLE IF NOT EXISTS Discussion (
    id SERIAL PRIMARY KEY, -- Auto-incrementing primary key
    title VARCHAR(255) NOT NULL,
    current_user_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    other_user_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_message TEXT
);

-- Create the Session table to track user sessions
CREATE TABLE IF NOT EXISTS Session (
    id SERIAL PRIMARY KEY, -- Auto-incrementing primary key
    user_id INTEGER REFERENCES "User"(id) ON DELETE CASCADE,
    session_token VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL
);
