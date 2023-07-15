USE SpotifyProject;
​
# Do Premium customers listen to more recent songs?: No significant findings
SELECT DISTINCT Customers.type_of_subscription, Songs_General_Features.year_of_release
FROM Customers
JOIN Listening_Times ON Customers.customer_ID = Listening_Times.customer_ID
JOIN Songs_General_Features ON Songs_General_Features.song_ID = Listening_Times.song_ID
ORDER BY Songs_General_Features.year_of_release DESC;

# Do Premium customers listen to more songs on repeat? as expected because of the limit of songs free users have
SELECT Customers.type_of_subscription, sum(Listening_Times.number_of_times_played)
FROM Customers
JOIN Listening_Times ON Customers.customer_ID = Listening_Times.customer_ID
Group by Customers.type_of_subscription;

# Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis
# What albums have the most songs added to favourites?
Create view view_of_albums_with_most_liked_songs
as
SELECT (select count(Listening_Times.added_to_favourites) from Listening_Times), Albums.album_name, Top_Songs.song_name
FROM Listening_Times
JOIN Top_Songs ON Listening_Times.song_ID = Top_Songs.song_ID
JOIN Albums ON Top_Songs.album_ID = Albums.album_ID
JOIN Artists ON Albums.artist_ID = Artists.artist_ID
WHERE Listening_Times.added_to_favourites = 1;
Group By Albums.album_name
order by count(Listening_Times.added_to_favourites) desc;
drop view view_of_albums_with_most_liked_songs;
select * from view_of_albums_with_most_liked_songs;

#Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
SELECT Instrumental_properties.song_ID, Instrumental_properties.loudnessdB, 
Instrumental_properties.valence, 
Instrumental_properties.acoustic
from Instrumental_properties
WHERE song_ID IN (
SELECT song_ID
FROM Top_Songs
WHERE genre like '%Pop%'
)
ORDER BY song_ID ASC;