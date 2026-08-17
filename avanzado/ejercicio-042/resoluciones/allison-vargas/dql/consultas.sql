USE playlist_musical_window_db;

-- Consulta 1: Utilizar ROW_NUMBER() para enumerar las canciones según sus reproducciones globales
SELECT 
    ROW_NUMBER() OVER (ORDER BY reproducciones DESC) AS 'Ranking Global',
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    genero_musical AS 'Género',
    reproducciones AS 'Reproducciones'
FROM playlist_musical;

-- Consulta 2: Utilizar RANK() y PARTITION BY para rankear canciones según reproducciones dentro de cada género
SELECT 
    genero_musical AS 'Género',
    RANK() OVER (PARTITION BY genero_musical ORDER BY reproducciones DESC) AS 'Ranking en Género',
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    reproducciones AS 'Reproducciones'
FROM playlist_musical;

-- Consulta 3: Utilizar SUM() OVER() para calcular el acumulado histórico de reproducciones en orden cronológico
SELECT 
    id_cancion AS 'ID',
    titulo_cancion AS 'Canción',
    reproducciones AS 'Reproducciones',
    SUM(reproducciones) OVER (ORDER BY id_cancion ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Reproducciones Acumuladas'
FROM playlist_musical;

-- Consulta 4: Utilizar AVG() OVER() para comparar la duración de cada canción frente al promedio de su género
SELECT 
    titulo_cancion AS 'Canción',
    genero_musical AS 'Género',
    duracion_segundos AS 'Duración (s)',
    ROUND(AVG(duracion_segundos) OVER (PARTITION BY genero_musical), 2) AS 'Promedio Género (s)'
FROM playlist_musical;

-- Consulta 5: Utilizar DENSE_RANK() para clasificar las pistas más largas dentro del catálogo musical
SELECT 
    DENSE_RANK() OVER (ORDER BY duracion_segundos DESC) AS 'Ranking Duración',
    titulo_cancion AS 'Canción',
    artista AS 'Artista',
    duracion_segundos AS 'Duración (s)',
    estado_cancion AS 'Estado'
FROM playlist_musical;
