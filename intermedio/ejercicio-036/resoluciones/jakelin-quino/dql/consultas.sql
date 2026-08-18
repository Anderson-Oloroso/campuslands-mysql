-- 1. Ver todas las marcas
SELECT * FROM `ejercicio-036-int-marcas`;

-- 2. Autos con su marca
SELECT a.modelo, m.nombre AS marca, a.velocidad_max, a.precio
FROM `ejercicio-036-int-autos` a
INNER JOIN `ejercicio-036-int-marcas` m ON a.marca_id = m.id;

-- 3. Autos con especificaciones
SELECT a.modelo, m.nombre AS marca, e.combustible, e.potencia
FROM `ejercicio-036-int-autos` a
INNER JOIN `ejercicio-036-int-marcas` m ON a.marca_id = m.id
INNER JOIN `ejercicio-036-int-especificaciones` e ON a.id = e.auto_id;

-- 4. Marcas italianas con autos potentes
SELECT m.nombre, a.modelo, e.potencia
FROM `ejercicio-036-int-marcas` m
INNER JOIN `ejercicio-036-int-autos` a ON m.id = a.marca_id
INNER JOIN `ejercicio-036-int-especificaciones` e ON a.id = e.auto_id
WHERE m.pais = 'Italia' AND e.potencia > 900;

-- 5. Autos híbridos con precio > 1000000
SELECT a.modelo, m.nombre AS marca, a.precio
FROM `ejercicio-036-int-autos` a
INNER JOIN `ejercicio-036-int-marcas` m ON a.marca_id = m.id
INNER JOIN `ejercicio-036-int-especificaciones` e ON a.id = e.auto_id
WHERE e.combustible = 'híbrido' AND a.precio > 1000000;