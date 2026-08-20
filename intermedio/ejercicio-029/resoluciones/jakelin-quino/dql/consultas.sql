-- Vista 1: Productos de accesorios
CREATE VIEW `v_accesorios` AS
SELECT nombre, precio, stock
FROM `ejercicio-029-int-productos`
WHERE categoria = 'accesorios';

-- Vista 2: Productos con stock mayor a 15
CREATE VIEW `v_stock_alto` AS
SELECT nombre, categoria, stock
FROM `ejercicio-029-int-productos`
WHERE stock > 15;

-- Consultar vistas
SELECT * FROM `v_accesorios`;
SELECT * FROM `v_stock_alto`;