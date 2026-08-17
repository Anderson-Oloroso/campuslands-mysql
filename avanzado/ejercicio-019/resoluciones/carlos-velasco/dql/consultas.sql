-- ============================================================
-- Ejercicio 019 - Consultas y pruebas de triggers
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Saltos realizados con información del paracaidista y equipo.
-- ------------------------------------------------------------
SELECT
    s.id_salto,
    p.nombre AS paracaidista,
    p.nivel_experiencia,
    e.codigo AS equipo,
    s.fecha_salto,
    s.altura_metros,
    s.duracion_segundos,
    s.estado
FROM saltos AS s
INNER JOIN paracaidistas AS p
    ON p.id_paracaidista = s.id_paracaidista
INNER JOIN equipos AS e
    ON e.id_equipo = s.id_equipo
WHERE s.estado = 'realizado'
ORDER BY s.fecha_salto;


-- ------------------------------------------------------------
-- Consulta 2
-- Equipos con menor disponibilidad.
-- Permite comprobar el efecto de trg_actualizar_salto_realizado.
-- ------------------------------------------------------------
SELECT
    id_equipo,
    codigo,
    tipo,
    marca,
    disponibilidad,
    estado
FROM equipos
ORDER BY disponibilidad ASC, codigo ASC;


-- ------------------------------------------------------------
-- Consulta 3
-- Paracaidistas con mayor cantidad de saltos registrados.
-- ------------------------------------------------------------
SELECT
    id_paracaidista,
    nombre,
    nivel_experiencia,
    saltos_realizados,
    RANK() OVER (
        ORDER BY saltos_realizados DESC
    ) AS posicion
FROM paracaidistas
WHERE estado = 'activo'
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 4
-- Promedio de altura y duración por nivel de experiencia.
-- ------------------------------------------------------------
SELECT
    p.nivel_experiencia,
    COUNT(s.id_salto) AS total_saltos,
    AVG(s.altura_metros) AS altura_promedio,
    AVG(s.duracion_segundos) AS duracion_promedio
FROM paracaidistas AS p
INNER JOIN saltos AS s
    ON s.id_paracaidista = p.id_paracaidista
WHERE s.estado = 'realizado'
GROUP BY p.nivel_experiencia
ORDER BY altura_promedio DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Equipos que ya fueron utilizados en saltos realizados.
-- ------------------------------------------------------------
SELECT
    e.codigo AS equipo,
    e.tipo,
    e.marca,
    COUNT(s.id_salto) AS saltos_realizados_con_equipo
FROM equipos AS e
INNER JOIN saltos AS s
    ON s.id_equipo = e.id_equipo
WHERE s.estado = 'realizado'
GROUP BY
    e.id_equipo,
    e.codigo,
    e.tipo,
    e.marca
ORDER BY saltos_realizados_con_equipo DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Saltos por encima de la altura promedio.
-- ------------------------------------------------------------
SELECT
    s.id_salto,
    p.nombre AS paracaidista,
    s.altura_metros,
    s.duracion_segundos
FROM saltos AS s
INNER JOIN paracaidistas AS p
    ON p.id_paracaidista = s.id_paracaidista
WHERE s.estado = 'realizado'
  AND s.altura_metros > (
      SELECT AVG(altura_metros)
      FROM saltos
      WHERE estado = 'realizado'
  )
ORDER BY s.altura_metros DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Auditoría generada automáticamente por el trigger
-- de cambios de estado.
-- ------------------------------------------------------------
SELECT
    a.id_auditoria,
    a.id_salto,
    p.nombre AS paracaidista,
    a.estado_anterior,
    a.estado_nuevo,
    a.fecha_cambio
FROM auditoria_saltos AS a
INNER JOIN saltos AS s
    ON s.id_salto = a.id_salto
INNER JOIN paracaidistas AS p
    ON p.id_paracaidista = s.id_paracaidista
ORDER BY a.fecha_cambio DESC;


-- ------------------------------------------------------------
-- Consulta 8
-- Resumen de saltos realizados por equipo.
-- ------------------------------------------------------------
SELECT
    e.tipo,
    COUNT(s.id_salto) AS total_saltos,
    AVG(s.altura_metros) AS altura_promedio,
    MAX(s.altura_metros) AS altura_maxima
FROM equipos AS e
INNER JOIN saltos AS s
    ON s.id_equipo = e.id_equipo
WHERE s.estado = 'realizado'
GROUP BY e.tipo
HAVING total_saltos > 0
ORDER BY total_saltos DESC;


-- ============================================================
-- PRUEBA DEL TRIGGER DE AUDITORIA
-- ============================================================

-- Cambiar un salto programado a realizado.
-- Esto debe generar automáticamente un registro
-- en auditoria_saltos.
UPDATE saltos
SET estado = 'realizado'
WHERE id_salto = 7;


-- Comprobar la auditoría generada.
SELECT
    id_auditoria,
    id_salto,
    estado_anterior,
    estado_nuevo,
    fecha_cambio
FROM auditoria_saltos
WHERE id_salto = 7;


-- Comprobar que el equipo utilizado por el salto 7
-- mantiene su disponibilidad según el trigger de inserción.
SELECT
    e.id_equipo,
    e.codigo,
    e.disponibilidad,
    e.estado
FROM equipos AS e
INNER JOIN saltos AS s
    ON s.id_equipo = e.id_equipo
WHERE s.id_salto = 7;


-- ============================================================
-- PRUEBA DEL TRIGGER DE VALIDACION
-- ============================================================

-- Esta sentencia debe generar un error porque PAR-010
-- está en mantenimiento.
--
-- Ejecutarla manualmente para comprobar el trigger.
--
-- INSERT INTO saltos (
--     id_paracaidista,
--     id_equipo,
--     fecha_salto,
--     altura_metros,
--     duracion_segundos,
--     estado
-- )
-- VALUES (
--     3,
--     10,
--     '2026-08-20 10:00:00',
--     3000,
--     180,
--     'programado'
-- );