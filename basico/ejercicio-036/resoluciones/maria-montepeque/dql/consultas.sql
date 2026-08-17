USE campuslands_mysql;

-- 1. Autos disponibles
SELECT marca, modelo, anio, precio
FROM hiperdeportivos_basico
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 2. Autos de una marca especifica
SELECT modelo, anio, potencia_hp
FROM hiperdeportivos_basico
WHERE marca = 'Ferrari';

-- 3. Autos con potencia mayor a 1000 hp que no esten vendidos
SELECT marca, modelo, potencia_hp, estado
FROM hiperdeportivos_basico
WHERE potencia_hp > 1000 AND estado <> 'vendido';

-- 4. Autos de las marcas Ferrari o Lamborghini
SELECT marca, modelo, precio
FROM hiperdeportivos_basico
WHERE marca IN ('Ferrari', 'Lamborghini');

-- 5. Autos con precio entre 300000 y 700000
SELECT marca, modelo, precio
FROM hiperdeportivos_basico
WHERE precio BETWEEN 300000 AND 700000
ORDER BY precio;

-- 6. Autos con velocidad maxima de al menos 400 km/h o titulo con "GT" en el modelo
SELECT marca, modelo, velocidad_max_kmh
FROM hiperdeportivos_basico
WHERE velocidad_max_kmh >= 400 OR modelo LIKE '%GT%';
