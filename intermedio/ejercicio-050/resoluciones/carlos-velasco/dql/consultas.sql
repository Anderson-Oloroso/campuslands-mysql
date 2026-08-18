USE campuslands_mysql;

-- 1. Citas cuyo precio está por encima del precio promedio de todas las citas.
SELECT
    id_cita,
    id_cliente,
    id_tatuador,
    precio,
    estado
FROM citas
WHERE precio > (
    SELECT AVG(precio)
    FROM citas
)
ORDER BY precio DESC;


-- 2. Cita o citas con el precio más alto.
SELECT
    id_cita,
    id_cliente,
    id_tatuador,
    precio,
    fecha_cita
FROM citas
WHERE precio = (
    SELECT MAX(precio)
    FROM citas
);


-- 3. Tatuadores cuya tarifa por hora supera la tarifa promedio.
SELECT
    id_tatuador,
    nombre,
    especialidad,
    tarifa_hora
FROM tatuadores
WHERE tarifa_hora > (
    SELECT AVG(tarifa_hora)
    FROM tatuadores
)
ORDER BY tarifa_hora DESC;


-- 4. Clientes que tienen al menos una cita registrada.
SELECT
    id_cliente,
    nombre,
    estado
FROM clientes
WHERE id_cliente IN (
    SELECT DISTINCT id_cliente
    FROM citas
)
ORDER BY nombre ASC;


-- 5. Clientes que tienen citas realizadas.
SELECT
    id_cliente,
    nombre
FROM clientes
WHERE id_cliente IN (
    SELECT DISTINCT id_cliente
    FROM citas
    WHERE estado = 'realizada'
)
ORDER BY nombre ASC;


-- 6. Citas cuyo precio es superior al promedio de las citas realizadas.
SELECT
    id_cita,
    id_cliente,
    id_tatuador,
    precio,
    estado
FROM citas
WHERE precio > (
    SELECT AVG(precio)
    FROM citas
    WHERE estado = 'realizada'
)
ORDER BY precio DESC;


-- 7. Clientes que no tienen ninguna cita cancelada.
SELECT
    c.id_cliente,
    c.nombre,
    c.estado
FROM clientes AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM citas AS ct
    WHERE ct.id_cliente = c.id_cliente
      AND ct.estado = 'cancelada'
)
ORDER BY c.nombre ASC;