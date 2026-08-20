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
    COUNT(*) AS total_participantes
FROM participantes;

SELECT
    estado,
    COUNT(*) AS total_participantes,
    SUM(distancia_km) AS distancia_total
FROM participantes
GROUP BY estado
ORDER BY total_participantes DESC;

SELECT
    categoria,
    COUNT(*) AS total_participantes,
    SUM(distancia_km) AS distancia_total,
    AVG(tiempo_minutos) AS tiempo_promedio
FROM participantes
GROUP BY categoria
ORDER BY total_participantes DESC;