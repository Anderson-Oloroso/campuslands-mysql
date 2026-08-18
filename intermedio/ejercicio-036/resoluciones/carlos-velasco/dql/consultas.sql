USE campuslands_mysql;

-- 1. Listar todos los autos registrados.
SELECT
    id_auto,
    marca,
    modelo,
    anio,
    potencia_hp,
    velocidad_max_kmh,
    precio_usd,
    estado
FROM autos_hiperdeportivos
ORDER BY marca, modelo;


-- 2. Mostrar los autos disponibles con más de 1000 HP.
SELECT
    marca,
    modelo,
    potencia_hp,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
  AND potencia_hp > 1000
ORDER BY potencia_hp DESC;


-- 3. Obtener los 5 autos con mayor velocidad máxima.
SELECT
    marca,
    modelo,
    velocidad_max_kmh
FROM autos_hiperdeportivos
ORDER BY velocidad_max_kmh DESC
LIMIT 5;


-- 4. Calcular la potencia promedio de los autos registrados.
SELECT
    ROUND(AVG(potencia_hp), 2) AS potencia_promedio_hp
FROM autos_hiperdeportivos;


-- 5. Calcular el precio promedio según el estado del auto.
SELECT
    estado,
    COUNT(*) AS total_autos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio_usd
FROM autos_hiperdeportivos
GROUP BY estado
ORDER BY precio_promedio_usd DESC;


-- 6. Mostrar los autos cuyo precio supera el precio promedio.
SELECT
    marca,
    modelo,
    precio_usd
FROM autos_hiperdeportivos
WHERE precio_usd > (
    SELECT AVG(precio_usd)
    FROM autos_hiperdeportivos
)
ORDER BY precio_usd DESC;


-- 7. Identificar el auto con mayor potencia.
SELECT
    marca,
    modelo,
    potencia_hp,
    motor
FROM autos_hiperdeportivos
WHERE potencia_hp = (
    SELECT MAX(potencia_hp)
    FROM autos_hiperdeportivos
);