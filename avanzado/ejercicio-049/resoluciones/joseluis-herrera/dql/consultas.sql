USE campuslands_mysql;

SELECT
    id_salto,
    nombre_paracaidista,
    nivel_experiencia,
    ubicacion,
    altura_salida_metros,
    estado
FROM saltos
WHERE estado = 'completado'
ORDER BY altura_salida_metros DESC;

SELECT
    nombre_paracaidista,
    duracion_segundos,
    puntuacion,
    ROUND((duracion_segundos / 60), 2) AS duracion_minutos
FROM saltos
WHERE puntuacion >= 85
ORDER BY puntuacion DESC;

SELECT
    nivel_experiencia,
    COUNT(*) AS total_saltos,
    ROUND(AVG(puntuacion), 2) AS puntuacion_promedio,
    ROUND(AVG(altura_salida_metros), 2) AS altura_promedio
FROM saltos
GROUP BY nivel_experiencia
ORDER BY puntuacion_promedio DESC;

SELECT
    ubicacion,
    COUNT(*) AS total_saltos,
    ROUND(AVG(puntuacion), 2) AS puntuacion_promedio
FROM saltos
GROUP BY ubicacion
HAVING COUNT(*) >= 2
ORDER BY puntuacion_promedio DESC;

SELECT
    a.id_auditoria,
    a.id_salto,
    s.nombre_paracaidista,
    a.accion,
    a.fecha_registro
FROM auditoria_saltos AS a
INNER JOIN saltos AS s
    ON a.id_salto = s.id_salto
ORDER BY a.fecha_registro ASC;