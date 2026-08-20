-- Consultas Avanzadas para Ejercicio 038 - roles y permisos para futbol sala
-- Concepto principal: roles y permisos
USE campuslands_mysql;

-- 1. Creacion y asignacion de roles y privilegios
CREATE ROLE IF NOT EXISTS rol_analista_futsal;
GRANT SELECT ON campuslands_mysql.equipos_futsal TO rol_analista_futsal;
GRANT SELECT ON campuslands_mysql.jugadores_futsal TO rol_analista_futsal;

CREATE USER IF NOT EXISTS 'auditor_futsal'@'localhost' IDENTIFIED BY 'AuditorPass123!';
GRANT rol_analista_futsal TO 'auditor_futsal'@'localhost';
SET DEFAULT ROLE rol_analista_futsal TO 'auditor_futsal'@'localhost';

SHOW GRANTS FOR 'auditor_futsal'@'localhost';

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_jugador) AS cantidad_registros,
    AVG(s.goles) AS promedio_categoria,
    (AVG(s.goles) - (SELECT AVG(goles) FROM jugadores_futsal)) AS diferencia_vs_global
FROM equipos_futsal p
INNER JOIN jugadores_futsal s ON p.id_equipo = s.id_equipo
GROUP BY p.id_equipo, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre AS origen,
    s.goles AS metrica_maxima
FROM jugadores_futsal s
INNER JOIN equipos_futsal p ON s.id_equipo = p.id_equipo
ORDER BY s.goles DESC
LIMIT 3;
