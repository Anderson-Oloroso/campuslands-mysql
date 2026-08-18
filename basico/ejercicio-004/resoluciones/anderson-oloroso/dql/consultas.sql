USE campuslands_mysql;

-- 1. Seleccionar todas las motocicletas del garaje y ordenarlas de mayor a menor según su precio
SELECT moto_id, marca, modelo, cilindraje, anio, precio, estado
FROM garaje_motos
ORDER BY precio DESC;

-- 2. Seleccionar únicamente las motocicletas que se encuentran actualmente disponibles
SELECT moto_id, marca, modelo, cilindraje, anio, precio
FROM garaje_motos
WHERE estado = 'Disponible';

-- 3. Contar la cantidad de motocicletas registradas por cada marca y ordenar los resultados según la cantidad
SELECT marca, COUNT(*) AS cantidad_motos
FROM garaje_motos
GROUP BY marca
ORDER BY cantidad_motos DESC;

-- 4. Seleccionar las motocicletas con un cilindraje mayor a 600 y ordenarlas de mayor a menor cilindraje
SELECT moto_id, marca, modelo, cilindraje, precio
FROM garaje_motos
WHERE cilindraje > 600
ORDER BY cilindraje DESC;

-- 5. Seleccionar las motocicletas disponibles cuyo precio sea superior a 50000000 y ordenar de mayor a menor precio
SELECT moto_id, marca, modelo, cilindraje, anio, precio
FROM garaje_motos
WHERE estado = 'Disponible' AND precio > 50000000.00
ORDER BY precio DESC;
