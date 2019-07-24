DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS properties_reviews;


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  thumbnail_photo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  cost_per_night INTEGER,
  street VARCHAR(255),
  parking_spaces VARCHAR(255),
  number_of_bathrooms VARCHAR(255),
  number_of_bedrooms VARCHAR(255),
  country VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN
);


CREATE TABLE reservations(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE properties_reviews(
  id SERIAL PRIMARY KEY,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  reservation_id INTEGER NOT NULL REFERENCES reservations(id) ON DELETE CASCADE,
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  rating INTEGER,
  message VARCHAR(255)
);