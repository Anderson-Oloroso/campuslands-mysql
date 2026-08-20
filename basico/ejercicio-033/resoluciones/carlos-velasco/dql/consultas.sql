USE inventario_skins_shooter;

-- 1. Mostrar todas las skins del inventario.
SELECT
    id_skin,
    nombre_skin,
    arma,
    rareza,
    precio,
    fecha_adquisicion,
    equipada
FROM skins
ORDER BY id_skin;


-- 2. Mostrar las skins actualmente equipadas.
SELECT
    id_skin,
    nombre_skin,
    arma,
    rareza,
    precio
FROM skins
WHERE equipada = TRUE
ORDER BY precio DESC;


-- 3. Mostrar las skins legendarias.
SELECT
    id_skin,
    nombre_skin,
    arma,
    precio
FROM skins
WHERE rareza = 'Legendaria'
ORDER BY precio DESC;


-- 4. Mostrar las 5 skins más costosas.
SELECT
    id_skin,
    nombre_skin,
    arma,
    rareza,
    precio
FROM skins
ORDER BY precio DESC
LIMIT 5;


-- 5. Calcular el valor total del inventario.
SELECT
    ROUND(SUM(precio), 2) AS valor_total_inventario
FROM skins;


-- 6. Calcular el precio promedio de las skins.
SELECT
    ROUND(AVG(precio), 2) AS precio_promedio
FROM skins;