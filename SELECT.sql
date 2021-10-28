select Name, count(*) 
from ArtistGenreCard
JOIN Genre ON Genre.id = GenreID
group by genre.name

select LaunchDate, count(*) 
from Track
JOIN Album ON Album.id = AlbumID
where LaunchDate >= 2019 and LaunchDate <= 2020
group by LaunchDate

select Album.name, ROUND(AVG(Duration),2) 
from Track JOIN Album ON Album.id = AlbumID
group by Album.name
order by AVG(Duration)

select artist.name from artist
JOIN AlbumArtistCard ON AlbumArtistCard.ArtistID = artist.id
JOIN Album ON Album.id = AlbumArtistCard.Albumid
where album.LaunchDate != 2020
group by artist.name;

select Collection.name  from Collection
JOIN CollectionTrackCard ON CollectionTrackCard.CollectionID = Collection.id
JOIN Track ON Track.ID = CollectionTrackCard.TrackID
JOIN Album ON Album.id = Track.Albumid
JOIN AlbumArtistCard ON AlbumArtistCard.Albumid = Album.id
JOIN Artist ON Artist.id = AlbumArtistCard.ArtistID
where Artist.id = 3
group by Collection.name;

select Artist.id , album.name from album
JOIN AlbumArtistCard ON AlbumArtistCard.Albumid = Album.id
JOIN Artist ON Artist.id = AlbumArtistCard.ArtistID
JOIN ArtistGenreCard ON ArtistGenreCard.ArtistID = Artist.ID
JOIN Genre ON Genre.ID = ArtistGenreCard.GenreID
Group by album.name;

select album.name from album
JOIN AlbumArtistCard ON AlbumArtistCard.Albumid = Album.id
JOIN Artist ON Artist.id = AlbumArtistCard.ArtistID
JOIN ArtistGenreCard ON ArtistGenreCard.ArtistID = Artist.ID
JOIN Genre ON Genre.ID = ArtistGenreCard.GenreID
GROUP BY album.name
HAVING COUNT(*)>1;

SELECT track.name From Track
LEFT OUTER JOIN CollectionTrackCard ON CollectionTrackCard.TrackID = Track.id
LEFT OUTER JOIN Collection ON Collection.ID = CollectionTrackCard.CollectionId
Where Collection.ID IS NULL
GROUP BY track.name;

SELECT Artist.name from artist
JOIN AlbumArtistCard ON AlbumArtistCard.ArtistID = artist.id
JOIN Album ON Album.id = AlbumArtistCard.Albumid
JOIN Track on Track.Albumid = Album.ID
WHERE Track.duration = (SELECT MAX(DURATION) FROM Track)
ORDER BY Artist.id;

SELECT Album.name from albums
JOIN Track on Track.Albumid = Album.ID
GROUP BY track.name;



название альбомов, содержащих наименьшее количество треков.