CREATE TABLE users
(
    id         VARCHAR(45) PRIMARY KEY,
    username   VARCHAR(255) NOT NULL UNIQUE,
    email      VARCHAR(255) NOT NULL UNIQUE,
    phone      VARCHAR(20)  NOT NULL,
    password   VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE properties
(
    id            VARCHAR(45) PRIMARY KEY,
    owner_id      VARCHAR(45)    NOT NULL,
    title         VARCHAR(255)   NOT NULL,
    thumbnail     text           not null,
    description   TEXT,
    address       VARCHAR(255)   NOT NULL,
    city          VARCHAR(100)   NOT NULL,
    price         DECIMAL(10, 2) NOT NULL,
    area          DECIMAL(10, 2) NOT NULL,
    num_bedrooms  INT            NOT NULL,
    num_bathrooms INT            NOT NULL,
    available     BOOLEAN   DEFAULT TRUE,
    status        varchar(20),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE CASCADE
);
CREATE TABLE property_reviews
(
    id          VARCHAR(45) PRIMARY KEY,
    property_id VARCHAR(45)  NOT NULL,
    platform    varchar(200) NOT NULL,
    review_url  VARCHAR(500) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties (id) ON DELETE CASCADE
);
CREATE TABLE media
(
    id          VARCHAR(45) PRIMARY KEY,
    property_id VARCHAR(45)  NOT NULL,
    media_type  varchar(20)  NOT NULL,
    url         VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties (id) ON DELETE CASCADE
);

CREATE TABLE amenities
(
    id   VARCHAR(45) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE property_amenities
(
    property_id VARCHAR(45) NOT NULL,
    amenity_id  VARCHAR(45) NOT NULL,
    PRIMARY KEY (property_id, amenity_id),
    FOREIGN KEY (property_id) REFERENCES properties (id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities (id) ON DELETE CASCADE
);
CREATE TABLE visits
(
    id          VARCHAR(45) PRIMARY KEY,
    user_id     VARCHAR(45) NOT NULL,
    property_id VARCHAR(45) NOT NULL,
    visit_date  DATE        NOT NULL,
    visit_time  TIME        NOT NULL,
    status      ENUM('PENDING', 'CONFIRMED', 'CANCELLED') DEFAULT 'PENDING',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties (id) ON DELETE CASCADE
);
CREATE TABLE roommate_requests
(
    id                 VARCHAR(45) PRIMARY KEY,
    user_id            VARCHAR(45)  NOT NULL,
    description        TEXT         NOT NULL,
    budget             DECIMAL(10, 2) CHECK (budget >= 0),
    preferred_location VARCHAR(255) NOT NULL,
    move_in_date       DATE,
    created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
CREATE TABLE roommate_request_preferences
(
    id                VARCHAR(45) PRIMARY KEY,
    request_id        VARCHAR(45) NOT NULL,
    gender_preference ENUM('male', 'female', 'any') DEFAULT 'any',
    min_age           INT CHECK (min_age >= 18),
    max_age           INT CHECK (max_age >= min_age),
    pet_friendly      BOOLEAN   DEFAULT FALSE,
    smoking_allowed   BOOLEAN   DEFAULT FALSE,
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (request_id) REFERENCES roommate_requests (id) ON DELETE CASCADE
);