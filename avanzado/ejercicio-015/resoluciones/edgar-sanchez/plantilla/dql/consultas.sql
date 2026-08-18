EXPLAIN FORMAT=TREE
SELECT 
    v.videojuego_id,
    v.titulo_juego,
    d.nombre_estudio,
    v.genero,
    v.anio_lanzamiento,
    v.precio_base_usd
FROM videojuegos v
INNER JOIN desarrolladores_videojuegos d ON v.desarrollador_id = d.desarrollador_id
WHERE v.genero = 'Action RPG'
  AND v.anio_lanzamiento >= 2020
ORDER BY v.anio_lanzamiento DESC;

EXPLAIN FORMAT=TREE
SELECT 
    bu.nombre_usuario,
    p.nombre_plataforma,
    COUNT(bu.biblioteca_id) AS total_juegos_registrados,
    SUM(bu.horas_jugadas) AS total_horas_acumuladas,
    ROUND(AVG(bu.horas_jugadas), 2) AS promedio_horas_por_juego
FROM bibliotecas_usuarios bu
INNER JOIN plataformas_juego p ON bu.plataforma_id = p.plataforma_id
WHERE bu.estado_completado IN ('Completado', 'En Progreso')
GROUP BY bu.nombre_usuario, p.nombre_plataforma
HAVING total_horas_acumuladas >= 50.00
ORDER BY total_horas_acumuladas DESC;