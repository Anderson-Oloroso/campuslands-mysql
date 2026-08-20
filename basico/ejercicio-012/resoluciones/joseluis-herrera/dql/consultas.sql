SELECT
	p.titulo AS nombre_playlist,
	u.nombre AS propietario,
	p.visibilidad,
	p.fecha_creacion
	FROM playlists p
	INNER JOIN usuarios u ON p.usuario_id = u.usuario_id
	WHERE p.visibilidad = 'Publica';

SELECT
	c.titulo AS cancion,
	c.artista,
	c.duracion_segundos,
	p.titulo AS playlist
	FROM canciones c
	INNER JOIN playlists p ON c.playlist_id = p.playlist_id
	ORDER BY c.duracion_segundos DESC
	LIMIT 1;