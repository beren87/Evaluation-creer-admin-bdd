/* Création de la base de données */
CREATE DATABASE Cinema_db;

/* Création des tables */
CREATE TABLE Cinema
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nameCinema VARCHAR(255) NOT NULL,
    addressCinema VARCHAR(255) NOT NULL
);

CREATE TABLE MovieTheater 
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  numberSeats INT NOT NULL,
  cinema_id INT NOT NULL, 
  FOREIGN KEY (cinema_id) REFERENCES Cinema(id)
);

CREATE TABLE Movie
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    timeMovie INT NOT NULL,
    minimumAge INT NOT NULL
);

CREATE TABLE Session 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    openingHours DATETIME NOT NULL,
    movie_theater_id INT NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_theater_id) REFERENCES MovieTheater(id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

CREATE TABLE Booking
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    numberSeatsReserved INT NOT NULL,
    tariffs DECIMAL(5, 2) NOT NULL,
    session_id INT NOT NULL,
    FOREIGN KEY (session_id) REFERENCES Session(id)
);

/* Insèrtions de données factices */

/* Pour la table Cinema */
INSERT INTO Cinema (nameCinema, addressCinema) VALUES ('Cinema A', '123 Rue du Cinéma');
INSERT INTO Cinema (nameCinema, addressCinema) VALUES ('Cinema B', '456 Avenue des Films');
INSERT INTO Cinema (nameCinema, addressCinema) VALUES ('Cinema C', '789 Boulevard du Spectacle');

/* Pour la table MovieTheater */
INSERT INTO MovieTheater (numberSeats, cinema_id) VALUES (100, 1);
INSERT INTO MovieTheater (numberSeats, cinema_id) VALUES (80, 2);
INSERT INTO MovieTheater (numberSeats, cinema_id) VALUES (120, 3);

/* Pour la table Movie */
INSERT INTO Movie (title, timeMovie, minimumAge) VALUES ('Movie 1', 120, 12);
INSERT INTO Movie (title, timeMovie, minimumAge) VALUES ('Movie 2', 90, 12);
INSERT INTO Movie (title, timeMovie, minimumAge) VALUES ('Movie 3', 105, 16);

/* Pour la table Session */
INSERT INTO Session (openingHours, movie_theater_id, movie_id) VALUES ('2023-04-27 10:00:00', 1, 1);
INSERT INTO Session (openingHours, movie_theater_id, movie_id) VALUES ('2023-04-27 15:30:00', 2, 2);
INSERT INTO Session (openingHours, movie_theater_id, movie_id) VALUES ('2023-04-27 20:00:00', 3, 3);

/* Pour la table Booking */
INSERT INTO Booking (numberSeatsReserved, tariffs, session_id) VALUES (2, 15.99, 1);
INSERT INTO Booking (numberSeatsReserved, tariffs, session_id) VALUES (3, 12.50, 2);
INSERT INTO Booking (numberSeatsReserved, tariffs, session_id) VALUES (4, 9.99, 3);
