-- Consultas base. Completa o reemplaza segun el enunciado.

USE playlist_musical;

SELECT id_playlist, id_cancion, posicion
FROM playlist_cancion
WHERE id_playlist = 1 and posicion = 1;


SELECT concat(titulo, '-', duracion_segundos,'s') as cancion
FROM cancion INNER JOIN artista ON cancion.id_artista = artista.id_artista
WHERE genero = 'Pop' AND duracion_segundos > 200;