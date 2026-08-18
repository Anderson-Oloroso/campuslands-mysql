USE campuslands_mysql;

SELECT
    UPPER(nombre) AS destino,
    UPPER(pais) AS pais
FROM destinos
ORDER BY destino;

SELECT
    nombre,
    CONCAT('Q ', FORMAT(precio,2)) AS precio_paquete
FROM destinos
ORDER BY precio DESC;

SELECT
    nombre,
    pais,
    MONTHNAME(fecha_salida) AS mes_salida,
    YEAR(fecha_salida) AS anio
FROM destinos
ORDER BY fecha_salida;

SELECT
    categoria,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio),2) AS precio_promedio
FROM destinos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    nombre,
    duracion_dias,
    DATEDIFF(fecha_salida,CURDATE()) AS dias_para_salida
FROM destinos
ORDER BY fecha_salida;

SELECT
    nombre,
    LENGTH(nombre) AS longitud_nombre,
    LEFT(nombre,3) AS abreviatura
FROM destinos
ORDER BY longitud_nombre DESC;

SELECT
    pais,
    SUM(precio) AS ingresos_potenciales,
    MAX(precio) AS paquete_mas_costoso,
    MIN(precio) AS paquete_mas_economico
FROM destinos
GROUP BY pais
ORDER BY ingresos_potenciales DESC;