SELECT 
    p.pelicula_id,
    p.titulo,
    d.nombre_director,
    e.nombre_estudio,
    JSON_UNQUOTE(JSON_EXTRACT(p.metadatos_json, '$.subgenero')) AS subgenero,
    p.metadatos_json->>'$.clasificacion' AS clasificacion_edad,
    CAST(p.metadatos_json->>'$.presupuesto_usd' AS UNSIGNED) AS presupuesto_usd,
    CAST(p.metadatos_json->>'$.recaudacion_global_usd' AS UNSIGNED) AS recaudacion_usd,
    ROUND((CAST(p.metadatos_json->>'$.recaudacion_global_usd' AS UNSIGNED) / CAST(p.metadatos_json->>'$.presupuesto_usd' AS DECIMAL(12,2))), 2) AS multiplicador_retorno
FROM peliculas_miedo p
INNER JOIN directores_cine d ON p.director_id = d.director_id
INNER JOIN estudios_cinematograficos e ON p.estudio_id = e.estudio_id
WHERE JSON_CONTAINS(p.metadatos_json->'$.elementos_terror', '"Cultos"')
ORDER BY multiplicador_retorno DESC;

SELECT 
    p.pelicula_id,
    p.titulo,
    COUNT(c.calificacion_id) AS total_plataformas_evaluadas,
    ROUND(AVG(c.puntuacion), 2) AS puntuacion_promedio,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'plataforma', c.plataforma,
            'puntuacion', c.puntuacion,
            'detalles', c.resena_detalles_json
        )
    ) AS resumen_calificaciones_json
FROM peliculas_miedo p
INNER JOIN calificaciones_peliculas c ON p.pelicula_id = c.pelicula_id
GROUP BY p.pelicula_id, p.titulo
HAVING puntuacion_promedio >= 7.0
ORDER BY puntuacion_promedio DESC;