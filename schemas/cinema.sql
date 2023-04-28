CREATE TABLE Cinema
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nameCinema VARCHAR(255) NOT NULL,
    addressCinema VARCHAR(255) NOT NULL
);

CREATE TABLE MovieTheater 
(
  id INT PRIMARY KEY,
  numberSeats INT NOT NULL,
  cinema_id INT NOT NULL, 
  FOREIGN KEY (cinema_id) REFERENCES Cinema(id)
);

CREATE TABLE Movie
(
    id INT PRIMARY KEY,x
    title VARCHAR(255) NOT NULL,
    timeMovie INT NOT NULL,
    minimumAge INT NOT NULL
);

CREATE TABLE Session 
(
    id INT PRIMARY KEY,
    openingHours DATETIME NOT NULL,
    movie_theater_id INT NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_theater_id) REFERENCES MovieTheater(id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

CREATE TABLE Booking
(
    id INT PRIMARY KEY,
    numberSeatsReserved INT NOT NULL,
    tariffs DECIMAL(5, 2) NOT NULL,
    session_id INT NOT NULL,
    FOREIGN KEY (session_id) REFERENCES Session(id)
);