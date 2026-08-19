USE campuslands_mysql;

SELECT
    id_equipo,
    nombre,
    categoria,
    marca,
    precio,
    stock,
    estado
FROM equipos_streaming
WHERE estado = 'disponible'
ORDER BY nombre;

SELECT
    nombre,
    categoria,
    marca,
    precio
FROM equipos_streaming
ORDER BY precio DESC;

SELECT
    nombre,
    categoria,
    stock,
    precio
FROM equipos_streaming
WHERE stock > 0
ORDER BY stock DESC;

SELECT
    nombre,
    marca,
    precio,
    stock
FROM equipos_streaming
WHERE categoria = 'Audio'
  AND estado = 'disponible'
ORDER BY precio ASC;