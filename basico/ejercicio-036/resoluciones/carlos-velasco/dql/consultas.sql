USE campuslands_mysql;

-- 1. Mostrar todos los autos hiperdeportivos registrados.
SELECT
    id_auto,
    marca,
    modelo,
    potencia_hp,
    velocidad_max_kmh,
    precio_millones,
    anio,
    estado
FROM autos_hiperdeportivos
ORDER BY id_auto;


-- 2. Mostrar los autos con más de 1000 HP.
SELECT
    marca,
    modelo,
    potencia_hp,
    velocidad_max_kmh
FROM autos_hiperdeportivos
WHERE potencia_hp > 1000
ORDER BY potencia_hp DESC;


-- 3. Mostrar los autos cuya velocidad máxima sea superior a 400 km/h.
SELECT
    marca,
    modelo,
    velocidad_max_kmh,
    potencia_hp
FROM autos_hiperdeportivos
WHERE velocidad_max_kmh > 400
ORDER BY velocidad_max_kmh DESC;


-- 4. Mostrar los autos disponibles con un precio inferior a 3 millones.
SELECT
    marca,
    modelo,
    precio_millones,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
  AND precio_millones < 3.00
ORDER BY precio_millones ASC;


-- 5. Mostrar los autos fabricados desde 2023.
SELECT
    marca,
    modelo,
    anio,
    potencia_hp,
    precio_millones
FROM autos_hiperdeportivos
WHERE anio >= 2023
ORDER BY anio DESC, potencia_hp DESC;


-- 6. Mostrar los autos con potencia entre 1000 y 1600 HP.
SELECT
    marca,
    modelo,
    potencia_hp,
    velocidad_max_kmh,
    precio_millones
FROM autos_hiperdeportivos
WHERE potencia_hp BETWEEN 1000 AND 1600
ORDER BY potencia_hp DESC;