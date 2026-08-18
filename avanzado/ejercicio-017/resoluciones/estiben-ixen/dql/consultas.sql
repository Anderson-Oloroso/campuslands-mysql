-- Consultas Avanzadas para Ejercicio 017 - procedimientos almacenados para tienda de ropa
-- Concepto principal: procedimientos almacenados
USE campuslands_mysql;

-- 1. Llamada al Procedimiento Almacenado de prueba
CALL sp_registrar_o_actualizar_tienda_ropa('Elemento de Prueba Avanzado', 1, 999.99, @resultado);
SELECT @resultado AS mensaje_procedimiento;

-- Validar insercion
SELECT * FROM prendas_vestir WHERE nombre_articulo = 'Elemento de Prueba Avanzado';

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_marca AS categoria_principal,
    COUNT(s.id_prenda) AS cantidad_registros,
    AVG(s.color) AS promedio_categoria,
    (AVG(s.color) - (SELECT AVG(color) FROM prendas_vestir)) AS diferencia_vs_global
FROM marcas_ropa p
INNER JOIN prendas_vestir s ON p.id_marca = s.id_marca
GROUP BY p.id_marca, p.nombre_marca
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_articulo AS nombre_destacado,
    p.nombre_marca AS origen,
    s.color AS metrica_maxima
FROM prendas_vestir s
INNER JOIN marcas_ropa p ON s.id_marca = p.id_marca
ORDER BY s.color DESC
LIMIT 3;
