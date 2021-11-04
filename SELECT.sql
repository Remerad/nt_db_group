--1. количество исполнителей в каждом жанре;
select Name, count(*) 
from ArtistGenreCard
JOIN Genre ON Genre.id = GenreID
group by genre.name

--2. количество треков, вошедших в альбомы 2019-2020 годов;
select LaunchDate, count(*) 
from Track
JOIN Album ON Album.id = AlbumID
where LaunchDate >= 2019 and LaunchDate <= 2020
group by LaunchDate

--3. средняя продолжительность треков по каждому альбому;
select Album.name, ROUND(AVG(Duration),2) 
from Track JOIN Album ON Album.id = AlbumID
group by Album.name
order by AVG(Duration)

--4. все исполнители, которые не выпустили альбомы в 2020 году;
select DISTINCT artist.name from artist
JOIN AlbumArtistCard ON AlbumArtistCard.ArtistID = artist.id
JOIN Album ON Album.id = AlbumArtistCard.Albumid
where album.LaunchDate != 2020;

--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select DISTINCT Collection.name  from Collection
JOIN CollectionTrackCard ON CollectionTrackCard.CollectionID = Collection.id
JOIN Track ON Track.ID = CollectionTrackCard.TrackID
JOIN Album ON Album.id = Track.Albumid
JOIN AlbumArtistCard ON AlbumArtistCard.Albumid = Album.id
JOIN Artist ON Artist.id = AlbumArtistCard.ArtistID
where Artist.id = 3;

--6. название альбомов, в которых присутствуют исполнители более 1 жанра;
select album.name from album
JOIN AlbumArtistCard ON AlbumArtistCard.Albumid = Album.id
JOIN Artist ON Artist.id = AlbumArtistCard.ArtistID
JOIN ArtistGenreCard ON ArtistGenreCard.ArtistID = Artist.ID
JOIN Genre ON Genre.ID = ArtistGenreCard.GenreID
GROUP BY album.name
HAVING COUNT(*)>1;

--7. наименование треков, которые не входят в сборники;
SELECT track.name From Track
LEFT OUTER JOIN CollectionTrackCard ON CollectionTrackCard.TrackID = Track.id
LEFT OUTER JOIN Collection ON Collection.ID = CollectionTrackCard.CollectionId
Where Collection.ID IS NULL
GROUP BY track.name;

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT Artist.name from artist
JOIN AlbumArtistCard ON AlbumArtistCard.ArtistID = artist.id
JOIN Album ON Album.id = AlbumArtistCard.Albumid
JOIN Track on Track.Albumid = Album.ID
WHERE Track.duration = (SELECT MIN(DURATION) FROM Track)
ORDER BY Artist.id;

--9. название альбомов, содержащих наименьшее количество треков.
SELECT COUNT(Track.ID),  from Album
JOIN Track on Album.ID = Track.AlbumID
GROUP BY Album.ID
HAVING COUNT(Track.ID) = (
	SELECT COUNT(Track.ID) as cn from Album
	JOIN Track on Album.ID = Track.AlbumID
	GROUP BY Album.ID
	ORDER BY cn DESC
	LIMIT 1);
