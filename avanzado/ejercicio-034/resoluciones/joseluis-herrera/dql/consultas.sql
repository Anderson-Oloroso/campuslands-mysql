USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    categoria,
    anio,
    precio,
    estado
FROM motos
ORDER BY id;

SELECT
    id,
    marca,
    modelo,
    categoria,
    precio,
    estado
FROM motos
WHERE estado = 'disponible'
ORDER BY precio DESC;

SELECT
    categoria,
    COUNT(*) AS total_motos,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY categoria
HAVING COUNT(*) >= 2
ORDER BY precio_promedio DESC;

SELECT
    marca,
    COUNT(*) AS total_motos,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY marca
HAVING AVG(precio) > 40000
ORDER BY precio_promedio DESC;

SELECT
    id,
    marca,
    modelo,
    categoria,
    precio,
    estado
FROM motos
ORDER BY precio DESC
LIMIT 5;

SELECT
    a.id AS auditoria_id,
    a.moto_id,
    CONCAT(m.marca, ' ', m.modelo) AS moto,
    a.accion,
    a.fecha_evento,
    a.detalle
FROM auditoria_motos AS a
INNER JOIN motos AS m
    ON a.moto_id = m.id
ORDER BY a.fecha_evento ASC, a.id ASC;