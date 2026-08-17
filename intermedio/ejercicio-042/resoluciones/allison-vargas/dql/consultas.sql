USE playlist_musical_reportes_db;

-- Reporte 1: Listado general detallado del catálogo musical con formato legible y alias profesionales
SELECT 
    id_cancion AS 'ID Pista',
    titulo_cancion AS 'Título',
    artista AS 'Artista',
    genero_musical AS 'Género',
    duracion_segundos AS 'Duración (s)',
    reproducciones AS 'Reproducciones',
    estado_cancion AS 'Estado'
FROM playlist_musical
ORDER BY reproducciones DESC;

-- Reporte 2: Top 3 de canciones más populares de la plataforma basado en número de reproducciones
SELECT 
    titulo_cancion AS 'Canción Destacada',
    artista AS 'Artista',
    genero_musical AS 'Género',
    reproducciones AS 'Total Reproducciones'
FROM playlist_musical
ORDER BY reproducciones DESC
LIMIT 3;

-- Reporte 3: Estadísticas consolidadas por género musical (cantidad de pistas, suma y promedio de reproducciones)
SELECT 
    genero_musical AS 'Género Musical',
    COUNT(*) AS 'Total de Pistas',
    SUM(reproducciones) AS 'Reproducciones Acumuladas',
    ROUND(AVG(reproducciones), 2) AS 'Promedio de Reproducciones'
FROM playlist_musical
GROUP BY genero_musical
ORDER BY 'Reproducciones Acumuladas' DESC;

-- Reporte 4: Auditoría de pistas activas y favoritas con su respectiva duración en minutos y segundos
SELECT 
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    FLOOR(duracion_segundos / 60) AS 'Minutos',
    MOD(duracion_segundos, 60) AS 'Segundos',
    estado_cancion AS 'Estado Actual'
FROM playlist_musical
WHERE estado_cancion IN ('Activa', 'Favorita')
ORDER BY duracion_segundos DESC;

-- Reporte 5: Resumen operativo agrupado por estado de la canción para control de inventario musical
SELECT 
    estado_cancion AS 'Estado del Tema',
    COUNT(*) AS 'Cantidad de Canciones',
    SUM(duracion_segundos) AS 'Duración Total Acumulada (s)'
FROM playlist_musical
GROUP BY estado_cancion
ORDER BY 'Cantidad de Canciones' DESC;
