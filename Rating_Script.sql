-- Drop tables if they already exist
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS movies;

-- Create movies table

CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    year INT,
    genre VARCHAR(50)
);

-- Insert sample data into movies table
INSERT INTO movies (title, year, genre) VALUES
('Inception', 2010, 'Sci-Fi'),
('The Shawshank Redemption', 1994, 'Drama'),
('The Godfather', 1972, 'Crime'),
('The Dark Knight', 2008, 'Action'),
('Pulp Fiction', 1994, 'Crime'),
('Forrest Gump', 1994, 'Drama');

-- Create persons table
CREATE TABLE persons (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Insert sample data into persons table

INSERT INTO persons (name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Eve');

-- Create ratings table

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    person_id INT,
    rating INT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (person_id) REFERENCES persons(person_id)
);

-- Insert rating data into ratings table
 
INSERT INTO ratings (movie_id, person_id, rating) VALUES
(1, 1, 5),
(1, 2, 4),
(1, 3, 3),
(1, 4, 5),
(1, 5, 4),
(2, 1, 4),
(2, 2, 5),
(2, 3, 5),
(2, 4, 4),
(2, 5, 3),
(3, 1, 3),
(3, 2, 4),
(3, 3, 5),
(3, 4, 4),
(3, 5, 2),
(4, 1, 5),
(4, 2, 5),
(4, 3, 4),
(4, 4, 4),
(4, 5, 3),
(5, 1, 4),
(5, 2, 3),
(5, 3, 5),
(5, 4, 2),
(5, 5, 4),
(6, 1, 5),
(6, 2, 4),
(6, 3, 3),
(6, 4, 5),
(6, 5, 5);


-- The Populated Table

SELECT 
    p.name,
    MAX(IF(m.title = 'Inception', r.rating, NULL)) AS 'Inception',
    MAX(IF(m.title = 'The Shawshank Redemption', r.rating, NULL)) AS 'The Shawshank Redemption',
    MAX(IF(m.title = 'The Godfather', r.rating, NULL)) AS 'The Godfather',
    MAX(IF(m.title = 'The Dark Knight', r.rating, NULL)) AS 'The Dark Knight',
    MAX(IF(m.title = 'Pulp Fiction', r.rating, NULL)) AS 'Pulp Fiction',
    MAX(IF(m.title = 'Forrest Gump', r.rating, NULL)) AS 'Forrest Gump'
FROM 
    persons p
LEFT JOIN 
    ratings r ON p.person_id = r.person_id
LEFT JOIN 
    movies m ON m.movie_id = r.movie_id
GROUP BY 
    p.name
ORDER BY 
    p.name;
