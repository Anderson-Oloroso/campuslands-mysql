-- 1. Ver todos los productos
SELECT * FROM `ejercicio-017-bas-productos`;

-- 2. Productos disponibles
SELECT nombre, precio, stock FROM `ejercicio-017-bas-productos` WHERE disponible=1;

-- 3. Productos con precio mayor a 40
SELECT nombre, precio, talla FROM `ejercicio-017-bas-productos` WHERE precio > 40;
