USE playlist_musical_basico_db;

-- Consulta 1: Listado oficial de canciones ordenadas por su identificador único
SELECT 
    id_cancion AS 'ID',
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    genero_musical AS 'Género',
    duracion_segundos AS 'Duración (s)',
    reproducciones AS 'Reproducciones',
    estado_cancion AS 'Estado'
FROM playlist_musical
ORDER BY id_cancion ASC;

-- Consulta 2: Top 3 de canciones más reproducidas en la playlist
SELECT 
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    reproducciones AS 'Reproducciones'
FROM playlist_musical
ORDER BY reproducciones DESC
LIMIT 3;

-- Consulta 3: Reporte estadístico agrupado por género musical con total de pistas y reproducciones
SELECT 
    genero_musical AS 'Género',
    COUNT(*) AS 'Total de Canciones',
    SUM(reproducciones) AS 'Reproducciones Totales'
FROM playlist_musical
GROUP BY genero_musical
ORDER BY 'Reproducciones Totales' DESC;

-- Consulta 4: Filtrar canciones que se encuentran en estado Activa o Favorita
SELECT 
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    genero_musical AS 'Género',
    estado_cancion AS 'Estado'
FROM playlist_musical
WHERE estado_cancion IN ('Activa', 'Favorita')
ORDER BY artista ASC;

-- Consulta 5: Auditoría general de duración promedio agrupada por estado de la canción
SELECT 
    estado_cancion AS 'Estado',
    COUNT(*) AS 'Cantidad',
    AVG(duracion_segundos) AS 'Duración Promedio (s)'
FROM playlist_musical
GROUP BY estado_cancion
ORDER BY 'Cantidad' DESC;
