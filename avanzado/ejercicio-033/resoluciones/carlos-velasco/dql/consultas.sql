USE campuslands_mysql;

-- =========================================================
-- 1. Función para calcular el valor total de un registro
--    del inventario.
-- =========================================================

DROP FUNCTION IF EXISTS fn_calcular_valor_inventario;

DELIMITER $$

CREATE FUNCTION fn_calcular_valor_inventario(
    p_precio DECIMAL(10, 2),
    p_cantidad INT
)
RETURNS DECIMAL(12, 2)
DETERMINISTIC
BEGIN
    RETURN p_precio * p_cantidad;
END $$

DELIMITER ;


-- =========================================================
-- 2. Función para clasificar la rareza de una skin
-- =========================================================

DROP FUNCTION IF EXISTS fn_clasificar_raridad;

DELIMITER $$

CREATE FUNCTION fn_clasificar_raridad(
    p_rareza VARCHAR(20)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN CASE p_rareza
        WHEN 'legendaria' THEN 'alta'
        WHEN 'epica' THEN 'alta'
        WHEN 'rara' THEN 'media'
        WHEN 'poco_comun' THEN 'media'
        WHEN 'comun' THEN 'baja'
        ELSE 'sin_clasificar'
    END;
END $$

DELIMITER ;


-- =========================================================
-- 3. Inventario mostrando el valor total por skin
-- =========================================================

SELECT
    id_skin,
    nombre_skin,
    arma,
    rareza,
    precio,
    cantidad,
    fn_calcular_valor_inventario(precio, cantidad)
        AS valor_total_inventario,
    estado
FROM inventario_skins
ORDER BY valor_total_inventario DESC;


-- =========================================================
-- 4. Clasificación de las skins según su rareza
-- =========================================================

SELECT
    nombre_skin,
    arma,
    rareza,
    fn_clasificar_raridad(rareza) AS nivel_raridad,
    precio
FROM inventario_skins
ORDER BY precio DESC;


-- =========================================================
-- 5. Valor total de las skins disponibles
-- =========================================================

SELECT
    COUNT(*) AS total_skins,
    SUM(cantidad) AS unidades_disponibles,
    ROUND(
        SUM(fn_calcular_valor_inventario(precio, cantidad)),
        2
    ) AS valor_total
FROM inventario_skins
WHERE estado = 'disponible';


-- =========================================================
-- 6. Skins de alto nivel de rareza
-- =========================================================

SELECT
    nombre_skin,
    arma,
    rareza,
    precio,
    fn_clasificar_raridad(rareza) AS nivel_raridad
FROM inventario_skins
WHERE fn_clasificar_raridad(rareza) = 'alta'
ORDER BY precio DESC;


-- =========================================================
-- 7. Top 5 skins con mayor valor dentro del inventario
-- =========================================================

SELECT
    nombre_skin,
    arma,
    rareza,
    cantidad,
    precio,
    fn_calcular_valor_inventario(precio, cantidad)
        AS valor_inventario
FROM inventario_skins
ORDER BY valor_inventario DESC
LIMIT 5;