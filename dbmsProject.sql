-- Create the Movie Database
CREATE DATABASE IF NOT EXISTS MovieDB;
USE MovieDB;

-- Create the Movies Table
CREATE TABLE IF NOT EXISTS Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    genre VARCHAR(255),
    director VARCHAR(255),
    runtime INT,
    plot TEXT,
    poster_url VARCHAR(255)
);

-- Create the Actors Table
CREATE TABLE IF NOT EXISTS Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(50)
);

-- Create the MovieActors Table (Many-to-Many Relationship between Movies and Actors)
CREATE TABLE IF NOT EXISTS MovieActors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);


-- Create the Users Table (Optional)
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255)
);

-- Create the Reviews Table
CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    user_id INT,  -- Foreign key to Users table (if available)
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Add this line if Users table exists
);


-- Create the Ratings Table
CREATE TABLE IF NOT EXISTS Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    user_id INT,  -- Foreign key to Users table (if available)
    rating_value DECIMAL(3,1),  -- Assuming ratings are on a scale of 0.0 to 10.0
    rating_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Add this line if Users table exists
);

-- Create the Genres Table
CREATE TABLE IF NOT EXISTS Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) UNIQUE
);

-- Create the MovieGenres Table (Many-to-Many Relationship between Movies and Genres)
CREATE TABLE IF NOT EXISTS MovieGenres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Create Indexes for Optimization (Optional, based on query performance needs)
CREATE INDEX idx_movie_title ON Movies(title);
CREATE INDEX idx_actor_name ON Actors(name);
CREATE INDEX idx_genre_name ON Genres(genre_name);




-- Insert data into the Movies table
INSERT INTO Movies (title, release_year, genre, director, runtime, plot, poster_url) VALUES
('The Shawshank Redemption', 1994, 'Drama', 'Frank Darabont', 142, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://example.com/poster1.jpg'),
('The Godfather', 1972, 'Crime, Drama', 'Francis Ford Coppola', 175, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'https://example.com/poster2.jpg'),
('The Dark Knight', 2008, 'Action, Crime, Drama', 'Christopher Nolan', 152, 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 'https://example.com/poster3.jpg'),
('Pulp Fiction', 1994, 'Crime, Drama', 'Quentin Tarantino', 154, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://example.com/poster4.jpg'),
('The Lord of the Rings: The Return of the King', 2003, 'Adventure, Drama, Fantasy', 'Peter Jackson', 201, 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'https://example.com/poster5.jpg'),
('Forrest Gump', 1994, 'Drama, Romance', 'Robert Zemeckis', 142, 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'https://example.com/poster6.jpg'),
('Inception', 2010, 'Action, Adventure, Sci-Fi', 'Christopher Nolan', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'https://example.com/poster7.jpg'),
('The Matrix', 1999, 'Action, Sci-Fi', 'Lana Wachowski, Lilly Wachowski', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'https://example.com/poster8.jpg'),
('The Lion King', 1994, 'Animation, Adventure, Drama', 'Roger Allers, Rob Minkoff', 88, 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 'https://example.com/poster9.jpg'),
('Gladiator', 2000, 'Action, Adventure, Drama', 'Ridley Scott', 155, 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'https://example.com/poster10.jpg');

-- Insert data into the Actors table
INSERT INTO Actors (name, birthdate, nationality) VALUES
('Morgan Freeman', '1937-06-01', 'American'),
('Marlon Brando', '1924-04-03', 'American'),
('Heath Ledger', '1979-04-04', 'Australian'),
('John Travolta', '1954-02-18', 'American'),
('Elijah Wood', '1981-01-28', 'American'),
('Tom Hanks', '1956-07-09', 'American'),
('Leonardo DiCaprio', '1974-11-11', 'American'),
('Keanu Reeves', '1964-09-02', 'Canadian'),
('Matthew McConaughey', '1969-11-04', 'American'),
('Russell Crowe', '1964-04-07', 'New Zealander');

-- Insert data into the Reviews table
INSERT INTO Reviews (movie_id, user_id, review_text, review_date) VALUES
(1, 1, 'An amazing film with powerful performances.', '2024-03-25'),
(2, 2, 'A classic that everyone should watch.', '2024-03-26'),
(3, 3, 'The best Batman movie ever made!', '2024-03-27'),
(4, 4, 'Quentin Tarantino\'s masterpiece.', '2024-03-26'),
(5, 5, 'Epic conclusion to the trilogy.', '2024-03-25'),
(6, 6, 'Heartwarming and inspirational.', '2024-03-27'),
(7, 7, 'Mind-bending and visually stunning.', '2024-03-25'),
(8, 8, 'Revolutionized the action genre.', '2024-03-26'),
(9, 9, 'A timeless Disney classic.', '2024-03-27'),
(10, 10, 'Epic battle scenes and great story.', '2024-03-26');

-- Insert data into the Users table
INSERT INTO Users (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5'),
('user6', 'user6@example.com', 'password6'),
('user7', 'user7@example.com', 'password7'),
('user8', 'user8@example.com', 'password8'),
('user9', 'user9@example.com', 'password9'),
('user10', 'user10@example.com', 'password10');

-- Insert data into the Ratings table
INSERT INTO Ratings (movie_id, user_id, rating_value, rating_date) VALUES
(1, 1, 9.5, '2024-03-25'),
(2, 2, 9.0, '2024-03-26'),
(3, 3, 10.0, '2024-03-27'),
(4, 4, 8.5, '2024-03-26'),
(5, 5, 9.8, '2024-03-25'),
(6, 6, 9.2, '2024-03-27'),
(7, 7, 9.7, '2024-03-25'),
(8, 8, 9.0, '2024-03-26'),
(9, 9, 9.5, '2024-03-27'),
(10, 10, 9.3, '2024-03-26');


-- 1. Retrieve the titles and release years of all movies.
SELECT title, release_year FROM Movies;

-- 2. Update the director of the movie with movie_id 1 to 'Christopher Nolan'.
UPDATE Movies SET director = 'Christopher Nolan' WHERE movie_id = 1;

-- 3. Delete the actor with actor_id 3 from the Actors table.
DELETE FROM Actors WHERE actor_id = 3;

-- 4. Add a new column 'country' to the Actors table to store their country of origin.
ALTER TABLE Actors ADD COLUMN country VARCHAR(50);

-- 5. Find the average rating value across all movies.
SELECT AVG(rating_value) AS average_rating FROM Ratings;

-- 6. Get the movie title, director name, and release year for all movies.
SELECT m.title, m.director, m.release_year FROM Movies m;

-- 7. List all unique genres across Movies and Genres tables.
SELECT DISTINCT genre FROM Movies UNION SELECT genre_name FROM Genres;

-- 8. List all possible combinations of movie titles and actor names.
SELECT m.title, a.name FROM Movies m, Actors a;

-- 9. Create a view named "MovieRatings" to display movie titles and their corresponding ratings.
CREATE VIEW MovieRatings AS
SELECT m.title, r.rating_value FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id;

-- 10. List all movies sorted by their release year in descending order.
SELECT title, release_year FROM Movies ORDER BY release_year DESC;

-- 11. Find actors who were born after 1980.
SELECT name, birthdate FROM Actors WHERE YEAR(birthdate) > 1980;

-- 12. Update the email address of user 'user1' to 'person1@hotmail.com'.
UPDATE Users SET email = 'person1@hotmail.com' WHERE username = 'user1';

-- 13. Delete the review with review_id 5 from the Reviews table.
DELETE FROM Reviews WHERE review_id = 5;

-- 14. Count the number of movies in each genre.
SELECT genre, COUNT(*) AS movie_count FROM Movies GROUP BY genre;

-- 15. Get the movie title, director, and genre for all movies.
SELECT m.title, m.director, g.genre_name FROM Movies m
JOIN MovieGenres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id;

-- 16. List genres that exist both in the Movies and Genres tables.
SELECT g.genre_name
FROM Genres g
INNER JOIN (
    SELECT DISTINCT genre
    FROM Movies
) m ON g.genre_name = m.genre;

-- 17. List all combinations of user IDs and their corresponding ratings.
SELECT u.user_id, r.rating_value FROM Users u
JOIN Ratings r ON u.user_id = r.user_id;

-- 18. Create a view named "TopRatedMovies" to display movie titles with ratings above 9.0.
CREATE VIEW TopRatedMovies AS
SELECT m.title, r.rating_value FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id
WHERE r.rating_value > 9.0;

-- 19. List all actors sorted alphabetically by their names.
SELECT name FROM Actors ORDER BY name;

-- 20. Get the username and email of users who have rated movies.
SELECT u.username, u.email FROM Users u
JOIN Ratings r ON u.user_id = r.user_id;


-- 21. List all unique genres across Movies and Genres tables using UNION.
SELECT genre FROM Movies
UNION
SELECT genre_name FROM Genres;

-- 22. List all genres that exist in both Movies and Genres tables using INTERSECT 
SELECT DISTINCT m.genre
FROM Movies m
INNER JOIN Genres g ON m.genre = g.genre_name;

-- 23. List all genres from Genres table that are not present in Movies table using EXCEPT 
SELECT g.genre_name
FROM Genres g
LEFT JOIN Movies m ON g.genre_name = m.genre
WHERE m.genre IS NULL;

-- 24. List all actors who have acted in movies with ratings above 9.0
(SELECT a.name
FROM Actors a
JOIN MovieActors ma ON a.actor_id = ma.actor_id
JOIN Ratings r ON ma.movie_id = r.movie_id
WHERE r.rating_value > 9.0)
UNION
(SELECT a.name
FROM Actors a
JOIN MovieActors ma ON a.actor_id = ma.actor_id
JOIN Ratings r ON ma.movie_id = r.movie_id
WHERE r.rating_value > 9.0);