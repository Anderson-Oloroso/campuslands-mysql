
USE ejercicio_06;

SELECT * FROM modelos
WHERE potencia_hp > 1200;

SELECT nombre, precio 
FROM modelos
WHERE precio > 2000000;

SELECT * FROM clientes
WHERE ciudad = "Madrid";

SELECT * FROM ventas 
WHERE fecha > "2026-04-01";

SELECT m.nombre, m.potencia_hp
FROM modelos m
INNER JOIN fabricantes f 
ON m.id_fabricante = f.id_fabricante
WHERE f.nombre = "koenigsegg";
