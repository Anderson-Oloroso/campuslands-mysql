-- ============================================================
-- Ejercicio 020 - Consultas e indices
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Tatuadores activos por especialidad.
-- ------------------------------------------------------------
SELECT
    nombre AS tatuador,
    especialidad,
    experiencia_anios
FROM tatuadores
WHERE estado = 'activo'
ORDER BY especialidad ASC, experiencia_anios DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Citas programadas ordenadas cronológicamente.
-- ------------------------------------------------------------
SELECT
    c.id_cita,
    cl.nombre AS cliente,
    t.nombre AS tatuador,
    c.fecha_cita,
    c.estilo,
    c.precio,
    c.estado
FROM citas AS c
INNER JOIN clientes AS cl
    ON cl.id_cliente = c.id_cliente
INNER JOIN tatuadores AS t
    ON t.id_tatuador = c.id_tatuador
WHERE c.estado = 'programada'
ORDER BY c.fecha_cita ASC;


-- ------------------------------------------------------------
-- Consulta 3
-- Citas de un tatuador en orden cronológico.
-- El filtro por id_tatuador y fecha aprovecha el índice
-- compuesto idx_citas_tatuador_fecha.
-- ------------------------------------------------------------
SELECT
    c.id_cita,
    t.nombre AS tatuador,
    cl.nombre AS cliente,
    c.fecha_cita,
    c.estilo,
    c.precio
FROM citas AS c
INNER JOIN tatuadores AS t
    ON t.id_tatuador = c.id_tatuador
INNER JOIN clientes AS cl
    ON cl.id_cliente = c.id_cliente
WHERE c.id_tatuador = 3
ORDER BY c.fecha_cita ASC;


-- ------------------------------------------------------------
-- Consulta 4
-- Ingresos generados por cada tatuador.
-- ------------------------------------------------------------
SELECT
    t.nombre AS tatuador,
    t.especialidad,
    COUNT(c.id_cita) AS citas_realizadas,
    SUM(c.precio) AS ingresos_generados,
    AVG(c.precio) AS ticket_promedio
FROM tatuadores AS t
INNER JOIN citas AS c
    ON c.id_tatuador = t.id_tatuador
WHERE c.estado = 'realizada'
GROUP BY
    t.id_tatuador,
    t.nombre,
    t.especialidad
ORDER BY ingresos_generados DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Estilos con más de una cita.
-- ------------------------------------------------------------
SELECT
    estilo,
    COUNT(*) AS total_citas,
    AVG(precio) AS precio_promedio,
    MAX(precio) AS precio_maximo
FROM citas
WHERE estado <> 'cancelada'
GROUP BY estilo
HAVING total_citas > 1
ORDER BY total_citas DESC;


-- ------------------------------------------------------------
-- Consulta 6
-- Clientes con citas programadas.
-- El índice compuesto idx_citas_cliente_estado permite
-- optimizar el acceso por cliente y estado.
-- ------------------------------------------------------------
SELECT
    cl.nombre AS cliente,
    cl.email,
    COUNT(c.id_cita) AS citas_programadas
FROM clientes AS cl
INNER JOIN citas AS c
    ON c.id_cliente = cl.id_cliente
WHERE c.estado = 'programada'
GROUP BY
    cl.id_cliente,
    cl.nombre,
    cl.email
ORDER BY citas_programadas DESC, cliente ASC;


-- ------------------------------------------------------------
-- Consulta 7
-- Citas cuyo precio supera el precio promedio general.
-- ------------------------------------------------------------
SELECT
    c.id_cita,
    cl.nombre AS cliente,
    t.nombre AS tatuador,
    c.estilo,
    c.precio
FROM citas AS c
INNER JOIN clientes AS cl
    ON cl.id_cliente = c.id_cliente
INNER JOIN tatuadores AS t
    ON t.id_tatuador = c.id_tatuador
WHERE c.estado <> 'cancelada'
  AND c.precio > (
      SELECT AVG(precio)
      FROM citas
      WHERE estado <> 'cancelada'
  )
ORDER BY c.precio DESC;


-- ------------------------------------------------------------
-- Consulta 8
-- Ranking de tatuadores por ingresos.
-- ------------------------------------------------------------
SELECT
    t.nombre AS tatuador,
    t.especialidad,
    SUM(c.precio) AS ingresos_generados,
    RANK() OVER (
        ORDER BY SUM(c.precio) DESC
    ) AS posicion
FROM tatuadores AS t
INNER JOIN citas AS c
    ON c.id_tatuador = t.id_tatuador
WHERE c.estado = 'realizada'
GROUP BY
    t.id_tatuador,
    t.nombre,
    t.especialidad
ORDER BY posicion;


-- ============================================================
-- COMPROBACION DE INDICES
-- ============================================================

-- ------------------------------------------------------------
-- EXPLAIN 1
-- Comprueba el indice idx_citas_tatuador_fecha.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_cita,
    id_tatuador,
    fecha_cita,
    estilo,
    precio
FROM citas
WHERE id_tatuador = 3
ORDER BY fecha_cita ASC;


-- ------------------------------------------------------------
-- EXPLAIN 2
-- Comprueba el indice idx_citas_cliente_estado.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_cita,
    id_cliente,
    estado,
    fecha_cita
FROM citas
WHERE id_cliente = 1
  AND estado = 'programada';


-- ------------------------------------------------------------
-- EXPLAIN 3
-- Comprueba el indice de fecha.
-- ------------------------------------------------------------
EXPLAIN
SELECT
    id_cita,
    fecha_cita,
    estado
FROM citas
WHERE fecha_cita >= '2026-08-23'
ORDER BY fecha_cita ASC;


-- ------------------------------------------------------------
-- Consulta adicional
-- Muestra los indices existentes en las tablas principales.
-- ------------------------------------------------------------
SHOW INDEX FROM citas;

SHOW INDEX FROM tatuadores;

SHOW INDEX FROM clientes;