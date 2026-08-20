USE campuslands_mysql;

SELECT
    COUNT(*) AS total_participantes
FROM participantes;


SELECT
    COUNT(*) AS participantes_finalizados
FROM participantes
WHERE estado = 'finalizo';

SELECT
    SUM(distancia_km) AS distancia_total_recorrida
FROM participantes
WHERE estado = 'finalizo';

SELECT
    categoria,
    COUNT(*) AS total_participantes
FROM participantes
GROUP BY categoria
ORDER BY total_participantes DESC;
