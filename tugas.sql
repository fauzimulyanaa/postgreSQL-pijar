
CREATE TABLE users (
  User_ID SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  Date_of_Birth DATE
);

CREATE TABLE Artists (
  Artist_ID SERIAL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Genre VARCHAR(50)
);

CREATE TABLE albums (
  Album_ID SERIAL PRIMARY KEY,
  Artist_ID INT,
  Name VARCHAR(50) NOT NULL,
  Release_Date DATE,
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Tracks (
  Track_ID SERIAL PRIMARY KEY,
  Album_ID INT,
  song_name VARCHAR(50) NOT NULL,
  Duration TIME NOT NULL,
  FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);


CREATE TABLE Playlists (
  Playlist_ID SERIAL PRIMARY KEY,
  User_ID INT,
  Name VARCHAR(50) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Playlist_Tracks (
  Playlist_ID INT,
  Track_ID INT,
  PRIMARY KEY (Playlist_ID, Track_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);




INSERT INTO users (name, email, password, Date_of_Birth) VALUES
('John Doe', 'john.doe@example.com', 'hashed_password_1', '1990-05-15'),
('Jane Smith', 'jane.smith@example.com', 'hashed_password_2', '1988-09-20'),
('Bob Johnson', 'bob.johnson@example.com', 'hashed_password_3', '1995-03-10'),
('Alice Brown', 'alice.brown@example.com', 'hashed_password_4', '1992-12-05'),
('Charlie White', 'charlie.white@example.com', 'hashed_password_5', '1987-07-25'),
('Susan Green', 'susan.green@example.com', 'hashed_password_6', '1998-01-30');
INSERT INTO Artists (Name, Genre) VALUES
('Ed Sheeran', 'Pop'),
('Adele', 'Pop'),
('Coldplay', 'Rock'),
('Taylor Swift', 'Pop'),
('Drake', 'Hip Hop'),
('Beyoncé', 'R&B');

INSERT INTO albums (Artist_ID, Name, Release_Date) VALUES
(1, 'divide', '2017-03-03'),
(2, '21', '2011-01-24'),
(3, 'A Head Full of Dreams', '2015-12-04'),
(4, '1989', '2014-10-27'),
(5, 'Views', '2016-04-29'),
(6, 'Lemonade', '2016-04-23');
-- Album Ed Sheeran - ÷
INSERT INTO Tracks (Album_ID, song_name, Duration) VALUES
(1, 'Shape of You', '00:03:53'),
(1, 'Castle on the Hill', '00:04:21'),
(1, 'Galway Girl', '00:02:58');

-- Album Adele - 21
INSERT INTO Tracks (Album_ID, song_name, Duration) VALUES
(2, 'Rolling in the Deep', '00:03:49'),
(2, 'Someone Like You', '00:04:45'),
(2, 'Set Fire to the Rain', '00:04:02');

-- Album Coldplay - A Head Full of Dreams
INSERT INTO Tracks (Album_ID, song_name, Duration) VALUES
(3, 'Adventure of a Lifetime', '00:04:23'),
(3, 'Hymn for the Weekend', '00:04:18'),
(3, 'Up&Up', '00:06:45');

-- Album Taylor Swift - 1989
INSERT INTO Tracks (Album_ID, song_name, Duration) VALUES
(4, 'Shake It Off', '00:03:39'),
(4, 'Blank Space', '00:03:51'),
(4, 'Bad Blood', '00:03:31');

INSERT INTO Playlists (User_ID, Name) VALUES
(1, 'Favorites'),
(1, 'Chill Vibes'),
(2, 'Best of 2010s'),
(2, 'Pop Hits'),
(3, 'R&B Jams'),
(3, 'Workout Mix');
INSERT INTO Playlist_Tracks (Playlist_ID, Track_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 1),
(6, 3);
INSERT INTO Playlist_Tracks (Playlist_ID, Track_ID) VALUES
(7, 1),
(7, 2),
(7, 3),
(8, 4),
(8, 5),
(9, 6),
(9, 1),
(9, 3);




SELECT tracks.duration FROM tracks WHERE duration > '00:03:00';
SELECT artists.name, artists.genre FROM artists ORDER BY name DESC;