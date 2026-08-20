-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_saga_activas;

CREATE VIEW vista_saga_activas AS
SELECT
    id,
    nombre,
    categoria,
    puntaje,
    estado
FROM intermedio_ejercicio_014
WHERE estado = 'activo';

SELECT *
FROM vista_saga_activas;


DROP VIEW IF EXISTS vista_saga_destacadas;

CREATE VIEW vista_saga_destacadas AS
SELECT
    id,
    nombre,
    categoria,
    puntaje
FROM intermedio_ejercicio_014
WHERE puntaje >= 90;

SELECT *
FROM vista_saga_destacadas
ORDER BY puntaje DESC;