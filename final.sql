USE SpotifyProject;

SELECT * FROM Customers;
SELECT * FROM Artists;
SELECT * FROM Albums;
SELECT * FROM Top_Songs;
SELECT * FROM Songs_General_Features;
SELECT * FROM Listening_Times;
SELECT * FROM Song_Rhythm;
SELECT * FROM Instrumental_Properties;
SELECT * FROM Playlists;

#
SELECT Songs_General_Features.song_name 
FROM Songs_General_Features
JOIN Song_Rhythm 
ON Songs_General_Features.song_ID = Song_Rhythm.song_ID
Where Song_Rhythm.energy > (SELECT avg(Song_Rhythm.energy) from Song_Rhythm)
And Song_Rhythm.tempo > (SELECT avg(Song_Rhythm.tempo) from Song_Rhythm)
OR Song_Rhythm.danceability > (SELECT avg(Song_Rhythm.danceability) from Song_Rhythm);

#Return Names Of all the Songs that have Properties like energy and danceability greater than Current song
SELECT Songs_General_Features.song_name
FROM Songs_General_Features
JOIN Song_Rhythm 
ON Songs_General_Features.song_ID = Song_Rhythm.song_ID
Where 
(Song_Rhythm.energy > (SELECT avg(Song_Rhythm.energy) from Song_Rhythm)
And Song_Rhythm.energy > (SELECT Song_Rhythm.energy FROM Songs_General_Features 
JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body')
)
OR 
(Song_Rhythm.tempo > (SELECT avg(Song_Rhythm.tempo) from Song_Rhythm)
And Song_Rhythm.tempo > (SELECT Song_Rhythm.tempo FROM Songs_General_Features 
JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body')
)
OR 
(Song_Rhythm.danceability > (SELECT avg(Song_Rhythm.danceability) from Song_Rhythm)
And Song_Rhythm.danceability > (SELECT Song_Rhythm.danceability FROM Songs_General_Features 
JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body')
);

SELECT Songs_General_Features.song_name FROM Songs_General_Features JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where  (Song_Rhythm.energy > (SELECT avg(Song_Rhythm.energy) from Song_Rhythm) And Song_Rhythm.energy > (SELECT Song_Rhythm.energy FROM Songs_General_Features  JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body') ) OR  (Song_Rhythm.tempo > (SELECT avg(Song_Rhythm.tempo) from Song_Rhythm) And Song_Rhythm.tempo > (SELECT Song_Rhythm.tempo FROM Songs_General_Features  JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body') ) OR  (Song_Rhythm.danceability > (SELECT avg(Song_Rhythm.danceability) from Song_Rhythm) And Song_Rhythm.danceability > (SELECT Song_Rhythm.danceability FROM Songs_General_Features  JOIN Song_Rhythm ON Songs_General_Features.song_ID = Song_Rhythm.song_ID Where song_name = 'Body') );