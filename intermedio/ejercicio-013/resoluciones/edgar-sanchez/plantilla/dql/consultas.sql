SELECT 
    p.pelicula_id,
    p.titulo_espanol,
    p.titulo_original,
    d.nombre_director,
    p.anio_estreno,
    GROUP_CONCAT(s.nombre_subgenero ORDER BY ps.nivel_relevancia ASC SEPARATOR ', ') AS subgeneros_asociados,
    COUNT(s.subgenero_id) AS cantidad_subgeneros
FROM peliculas_miedo p
INNER JOIN directores_miedo d ON p.director_id = d.director_id
INNER JOIN peliculas_subgeneros ps ON p.pelicula_id = ps.pelicula_id
INNER JOIN subgeneros_miedo s ON ps.subgenero_id = s.subgenero_id
GROUP BY p.pelicula_id, p.titulo_espanol, p.titulo_original, d.nombre_director, p.anio_estreno
ORDER BY p.anio_estreno DESC;

SELECT 
    s.subgenero_id,
    s.nombre_subgenero,
    COUNT(ps.pelicula_id) AS total_peliculas,
    COALESCE(SUM(p.recaudacion_usd), 0.00) AS recaudacion_total_usd,
    COALESCE(ROUND(AVG(p.recaudacion_usd), 2), 0.00) AS recaudacion_promedio_usd
FROM subgeneros_miedo s
LEFT JOIN peliculas_subgeneros ps ON s.subgenero_id = ps.subgenero_id
LEFT JOIN peliculas_miedo p ON ps.pelicula_id = p.pelicula_id
GROUP BY s.subgenero_id, s.nombre_subgenero
ORDER BY total_peliculas DESC, recaudacion_total_usd DESC;