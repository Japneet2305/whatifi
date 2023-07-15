CREATE DATABASE SpotifyProject;
USE SpotifyProject;

CREATE TABLE Customers (
customer_ID INT PRIMARY KEY, 
full_name VARCHAR(100), 
phone_number BIGINT, 
email_address VARCHAR(100), 
type_of_subscription VARCHAR(50),
nationality VARCHAR(50),
gender VARCHAR(20));

CREATE TABLE Artists (
artist VARCHAR(50), 
artist_ID INT,
genre VARCHAR(50),
average_monthly_streams INT,
CONSTRAINT PK_Artists PRIMARY KEY (artist_ID,genre));

CREATE TABLE Albums (
album_name VARCHAR(50), 
album_ID INT,
artist_ID INT,
PRIMARY KEY(album_ID),
genre VARCHAR(50),
year_released YEAR,
no_of_tracks INT,
length_in_seconds INT,
CONSTRAINT FK_Artists FOREIGN KEY (artist_ID,genre)
REFERENCES Artists(artist_ID,genre));

CREATE TABLE Top_Songs (
song_ID INT,
song_name VARCHAR(50),
artist_ID INT,
album_ID INT,
genre VARCHAR(50),
FOREIGN KEY (album_ID) REFERENCES Albums(album_ID),
CONSTRAINT PK_Top_Songs PRIMARY KEY(song_ID, song_name),
CONSTRAINT FK_Artists2 FOREIGN KEY(artist_ID,genre)
REFERENCES Artists(artist_ID,genre));

CREATE TABLE Playlists (
playlist_ID INT,
creator_ID INT);

CREATE TABLE Songs_General_Features (
song_ID INT,
song_name VARCHAR(50),
length_in_seconds INT,
year_of_release INT,
explicit BOOL,
CONSTRAINT FK_Top_Songs FOREIGN KEY (song_ID,song_name)
REFERENCES Top_Songs(song_ID,song_name));

CREATE TABLE Listening_Times (
song_ID INT,
song_name VARCHAR(50),
artist_ID INT,
customer_ID INT, 
FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID), 
number_of_times_played INT,
added_to_favourites BOOL,
CONSTRAINT FK_Top_Songs1 FOREIGN KEY (song_ID,song_name)
REFERENCES Top_Songs(song_ID,song_name));

CREATE TABLE Song_Rhythm (
song_ID INT,
tempo INT,
energy INT,
danceability INT,
CONSTRAINT FK_Top_Songs2 FOREIGN KEY (song_ID)
REFERENCES Top_Songs(song_ID)); 

CREATE TABLE Instrumental_Properties (
song_ID INT,
loudnessdB INT,
valence INT,
acoustic INT,
CONSTRAINT FK_Top_Songs3 FOREIGN KEY (song_ID)
REFERENCES Top_Songs(song_ID));


CREATE TABLE CustomerAge (
customer_ID INT,
FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID),
age INT);

CREATE TABLE InputTable(
tempo INT,
energy INT,
danceability INT);

