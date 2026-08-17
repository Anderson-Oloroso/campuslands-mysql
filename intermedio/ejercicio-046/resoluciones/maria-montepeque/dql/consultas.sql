USE campuslands_mysql;

-- 1. Listado de combos con el nombre de ambos platos (INNER JOIN doble sobre la misma tabla)
SELECT c.nombre_combo,
       pp.nombre_plato AS plato_principal,
       pa.nombre_plato AS acompanamiento,
       c.precio_combo
FROM combos_intermedio c
INNER JOIN platos_intermedio pp ON pp.id_plato = c.id_plato_principal
INNER JOIN platos_intermedio pa ON pa.id_plato = c.id_plato_acompanamiento
ORDER BY c.nombre_combo;

-- 2. Combos disponibles actualmente
SELECT c.nombre_combo, pp.nombre_plato AS plato_principal, pa.nombre_plato AS acompanamiento, c.precio_combo
FROM combos_intermedio c
INNER JOIN platos_intermedio pp ON pp.id_plato = c.id_plato_principal
INNER JOIN platos_intermedio pa ON pa.id_plato = c.id_plato_acompanamiento
WHERE c.disponible = TRUE;

-- 3. Todos los combos que incluyen "Hamburguesa Clasica" (como principal o como acompanamiento)
SELECT c.nombre_combo, pp.nombre_plato AS plato_principal, pa.nombre_plato AS acompanamiento
FROM combos_intermedio c
INNER JOIN platos_intermedio pp ON pp.id_plato = c.id_plato_principal
INNER JOIN platos_intermedio pa ON pa.id_plato = c.id_plato_acompanamiento
WHERE pp.nombre_plato = 'Hamburguesa Clasica' OR pa.nombre_plato = 'Hamburguesa Clasica';

-- 4. Cantidad de combos en los que cada plato aparece como principal
SELECT pp.nombre_plato AS plato_principal, COUNT(*) AS total_combos
FROM combos_intermedio c
INNER JOIN platos_intermedio pp ON pp.id_plato = c.id_plato_principal
GROUP BY pp.nombre_plato
ORDER BY total_combos DESC;

-- 5. Cantidad de combos por disponibilidad
SELECT disponible, COUNT(*) AS total_combos
FROM combos_intermedio
GROUP BY disponible;

-- 6. Combos con mayor ahorro respecto a comprar los platos por separado
SELECT c.nombre_combo,
       (pp.precio + pa.precio) AS precio_por_separado,
       c.precio_combo,
       (pp.precio + pa.precio) - c.precio_combo AS ahorro
FROM combos_intermedio c
INNER JOIN platos_intermedio pp ON pp.id_plato = c.id_plato_principal
INNER JOIN platos_intermedio pa ON pa.id_plato = c.id_plato_acompanamiento
ORDER BY ahorro DESC
LIMIT 3;
