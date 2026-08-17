-- ============================================================
-- Ejercicio 018 - Consultas y funciones SQL
-- Base de datos: campuslands_mysql
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Viajes disponibles con duración calculada mediante función.
-- ------------------------------------------------------------
SELECT
    v.id_viaje,
    v.nombre AS viaje,
    d.nombre AS destino,
    d.pais,
    v.fecha_salida,
    v.fecha_regreso,
    fn_duracion_viaje(
        v.fecha_salida,
        v.fecha_regreso
    ) AS duracion_dias,
    v.precio
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
WHERE v.estado = 'disponible'
ORDER BY duracion_dias DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Precio original, descuento y precio final por viaje.
-- ------------------------------------------------------------
SELECT
    v.nombre AS viaje,
    d.categoria,
    v.precio AS precio_original,
    fn_porcentaje_descuento(d.categoria) * 100 AS descuento_porcentaje,
    fn_precio_con_descuento(
        v.precio,
        d.categoria
    ) AS precio_final
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
ORDER BY precio_final DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Viajes de más de 5 días.
-- ------------------------------------------------------------
SELECT
    v.nombre AS viaje,
    d.nombre AS destino,
    fn_duracion_viaje(
        v.fecha_salida,
        v.fecha_regreso
    ) AS duracion_dias,
    v.precio
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
WHERE fn_duracion_viaje(
          v.fecha_salida,
          v.fecha_regreso
      ) > 5
ORDER BY duracion_dias DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Cantidad de viajes y precio promedio por categoría.
-- ------------------------------------------------------------
SELECT
    d.categoria,
    COUNT(v.id_viaje) AS total_viajes,
    AVG(v.precio) AS precio_promedio,
    AVG(
        fn_precio_con_descuento(
            v.precio,
            d.categoria
        )
    ) AS precio_promedio_final
FROM destinos AS d
INNER JOIN viajes AS v
    ON v.id_destino = d.id_destino
WHERE v.estado <> 'cancelado'
GROUP BY d.categoria
ORDER BY precio_promedio_final DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Total de personas reservadas por viaje.
-- ------------------------------------------------------------
SELECT
    v.nombre AS viaje,
    d.nombre AS destino,
    v.cupos AS cupos_disponibles,
    COALESCE(
        SUM(
            CASE
                WHEN r.estado IN ('confirmada', 'pendiente')
                THEN r.cantidad_personas
                ELSE 0
            END
        ),
        0
    ) AS personas_reservadas,
    v.cupos -
    COALESCE(
        SUM(
            CASE
                WHEN r.estado IN ('confirmada', 'pendiente')
                THEN r.cantidad_personas
                ELSE 0
            END
        ),
        0
    ) AS cupos_restantes
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
LEFT JOIN reservas AS r
    ON r.id_viaje = v.id_viaje
GROUP BY
    v.id_viaje,
    v.nombre,
    d.nombre,
    v.cupos
ORDER BY cupos_restantes ASC;


-- ------------------------------------------------------------
-- Consulta 6
-- Destinos con más de una reserva confirmada.
-- ------------------------------------------------------------
SELECT
    d.nombre AS destino,
    d.pais,
    COUNT(r.id_reserva) AS reservas_confirmadas,
    SUM(r.cantidad_personas) AS personas
FROM destinos AS d
INNER JOIN viajes AS v
    ON v.id_destino = d.id_destino
INNER JOIN reservas AS r
    ON r.id_viaje = v.id_viaje
WHERE r.estado = 'confirmada'
GROUP BY
    d.id_destino,
    d.nombre,
    d.pais
HAVING reservas_confirmadas > 1
ORDER BY personas DESC;


-- ------------------------------------------------------------
-- Consulta 7
-- Ranking de viajes por precio final después del descuento.
-- ------------------------------------------------------------
SELECT
    v.nombre AS viaje,
    d.categoria,
    fn_precio_con_descuento(
        v.precio,
        d.categoria
    ) AS precio_final,
    RANK() OVER (
        ORDER BY fn_precio_con_descuento(
            v.precio,
            d.categoria
        ) DESC
    ) AS posicion
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
WHERE v.estado <> 'cancelado'
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 8
-- Top 5 viajes por cantidad de personas confirmadas.
-- ------------------------------------------------------------
SELECT
    v.nombre AS viaje,
    d.nombre AS destino,
    SUM(r.cantidad_personas) AS personas_confirmadas,
    fn_duracion_viaje(
        v.fecha_salida,
        v.fecha_regreso
    ) AS duracion_dias
FROM viajes AS v
INNER JOIN destinos AS d
    ON d.id_destino = v.id_destino
INNER JOIN reservas AS r
    ON r.id_viaje = v.id_viaje
WHERE r.estado = 'confirmada'
GROUP BY
    v.id_viaje,
    v.nombre,
    d.nombre,
    v.fecha_salida,
    v.fecha_regreso
ORDER BY personas_confirmadas DESC
LIMIT 5;