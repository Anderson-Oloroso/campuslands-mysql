USE campuslands_mysql;

SELECT
    id_participante,
    codigo_inscripcion,
    CONCAT(nombre, ' ', apellido) AS participante,
    categoria,
    distancia_km,
    tiempo_minutos,
    estado
FROM participantes
ORDER BY id_participante;

SELECT
    categoria,
    COUNT(*) AS total_participantes,
    AVG(tiempo_minutos) AS tiempo_promedio
FROM participantes
GROUP BY categoria
ORDER BY total_participantes DESC;

SELECT
    distancia_km,
    COUNT(*) AS total_participantes,
    SUM(distancia_km) AS distancia_total
FROM participantes
WHERE estado = 'finalizo'
GROUP BY distancia_km
ORDER BY distancia_km;

SELECT
    codigo_inscripcion,
    CONCAT(nombre, ' ', apellido) AS participante,
    categoria,
    tiempo_minutos
FROM participantes
WHERE estado = 'finalizo'
ORDER BY tiempo_minutos ASC
LIMIT 5;