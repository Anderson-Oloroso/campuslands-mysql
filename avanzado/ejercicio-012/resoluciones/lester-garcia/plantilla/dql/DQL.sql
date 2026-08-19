USE ejercicio_12_adv;

-- 1. Ranking global de canciones por reproducciones
SELECT
    s.song_title,
    s.play_count,
    RANK() OVER (
        ORDER BY s.play_count DESC
    ) AS global_rank
FROM songs s;

-- 2. Ranking de canciones dentro de cada género
SELECT
    a.genre,
    s.song_title,
    s.play_count,
    RANK() OVER (
        PARTITION BY a.genre
        ORDER BY s.play_count DESC
    ) AS genre_rank
FROM songs s
INNER JOIN albums al
ON s.album_id = al.album_id
INNER JOIN artists a
ON al.artist_id = a.artist_id;


-- 3. Comparar las reproducciones con la canción anterior
SELECT
    s.song_title,
    s.play_count,
    LAG(s.play_count) OVER (
        ORDER BY s.play_count DESC
    ) AS previous_play_count
FROM songs s;


-- 4. Mostrar diferencia de reproducciones respecto a la canción anterior
SELECT
    s.song_title,
    s.play_count,
    LAG(s.play_count) OVER (
        ORDER BY s.play_count DESC
    ) AS previous_play_count,
    s.play_count -
    LAG(s.play_count) OVER (
        ORDER BY s.play_count DESC
    ) AS play_count_difference
FROM songs s;


-- 5. Acumulado de reproducciones
SELECT
    s.song_title,
    s.play_count,
    SUM(s.play_count) OVER (
        ORDER BY s.play_count DESC
    ) AS cumulative_plays
FROM songs s;


-- 6. Promedio de reproducciones de todas las canciones
-- y comparación de cada canción contra ese promedio
SELECT
    s.song_title,
    s.play_count,
    ROUND(
        AVG(s.play_count) OVER (),
        2
    ) AS average_plays,
    s.play_count -
    AVG(s.play_count) OVER () AS difference_from_average
FROM songs s
ORDER BY s.play_count DESC;