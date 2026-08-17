USE campuslands_mysql;

-- 1. Autos disponibles actualmente
SELECT marca, modelo, precio
FROM catalogo_hiperdeportivos
WHERE estado = 'disponible';

-- 2. Autos con potencia mayor a 1000 HP
SELECT marca, modelo, potencia_hp
FROM catalogo_hiperdeportivos
WHERE potencia_hp > 1000
ORDER BY potencia_hp DESC;

-- 3. Autos lanzados entre 2019 y 2021
SELECT marca, modelo, fecha_lanzamiento
FROM catalogo_hiperdeportivos
WHERE fecha_lanzamiento BETWEEN '2019-01-01' AND '2021-12-31';

-- 4. Autos agotados con precio mayor a 2000000
SELECT marca, modelo, precio
FROM catalogo_hiperdeportivos
WHERE estado = 'agotado' AND precio > 2000000;

-- 5. Autos sin precio confirmado (caso limite)
SELECT marca, modelo, estado
FROM catalogo_hiperdeportivos
WHERE precio = 0.00;