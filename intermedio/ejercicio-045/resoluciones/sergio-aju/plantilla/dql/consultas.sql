USE campuslands_mysql;

-- 1. Consulta con JOIN múltiple: Listar los videojuegos mostrando su género, plataforma asociada, precio y horas jugadas
SELECT 
    v.codigo_juego,
    v.titulo,
    g.nombre_genero,
    p.nombre_plataforma,
    v.precio,
    v.horas_jugadas,
    v.estado_biblioteca
FROM detalle_biblioteca_juegos v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
INNER JOIN plataformas_gamer p ON v.plataforma_id = p.id
ORDER BY v.horas_jugadas DESC;

-- 2. Reporte de Inversión y Rendimiento por Plataforma: Conteo de juegos y valor total invertido
SELECT 
    p.nombre_plataforma,
    COUNT(v.id) AS total_juegos,
    SUM(v.precio) AS inversion_total,
    ROUND(AVG(v.calificacion), 2) AS calificacion_promedio
FROM plataformas_gamer p
LEFT JOIN detalle_biblioteca_juegos v ON p.id = v.plataforma_id
GROUP BY p.id, p.nombre_plataforma
ORDER BY inversion_total DESC;

-- 3. Análisis de Horas Jugadas: Top 5 de videojuegos con mayor dedicación de tiempo del usuario
SELECT 
    v.titulo,
    g.nombre_genero,
    p.nombre_plataforma,
    v.horas_jugadas,
    v.calificacion
FROM detalle_biblioteca_juegos v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
INNER JOIN plataformas_gamer p ON v.plataforma_id = p.id
ORDER BY v.horas_jugadas DESC
LIMIT 5;

-- 4. Filtrado Avanzado: Videojuegos completados con calificación superior a 9.0 y más de 100 horas de juego
SELECT 
    v.titulo,
    g.nombre_genero,
    v.calificacion,
    v.horas_jugadas,
    v.estado_biblioteca
FROM detalle_biblioteca_juegos v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
WHERE v.estado_biblioteca = 'completado' 
  AND v.calificacion > 9.0 
  AND v.horas_jugadas > 100
ORDER BY v.calificacion DESC;

-- 5. Resumen Financiero Agrupado por Estado de la Biblioteca
SELECT 
    v.estado_biblioteca,
    COUNT(*) AS cantidad_juegos,
    SUM(v.precio) AS valor_monetario_estado,
    SUM(v.horas_jugadas) AS total_horas_estado
FROM detalle_biblioteca_juegos v
GROUP BY v.estado_biblioteca
ORDER BY cantidad_juegos DESC;