USE campuslands_mysql;

-- 1. Ilustraciones entregadas (WHERE con igualdad)
SELECT titulo, artista, precio, fecha_entrega
FROM ilustraciones_basico
WHERE estado = 'entregado'
ORDER BY fecha_entrega;

-- 2. Ilustraciones de un artista especifico
SELECT titulo, tipo_arte, estado
FROM ilustraciones_basico
WHERE artista = 'Camila Rendon';

-- 3. Ilustraciones con precio mayor a 200 que no esten entregadas
SELECT titulo, artista, precio, estado
FROM ilustraciones_basico
WHERE precio > 200 AND estado <> 'entregado';

-- 4. Ilustraciones hechas en Photoshop o Procreate
SELECT titulo, artista, software_principal
FROM ilustraciones_basico
WHERE software_principal IN ('Photoshop', 'Procreate');

-- 5. Ilustraciones con entrega programada en marzo de 2026
SELECT titulo, artista, fecha_entrega
FROM ilustraciones_basico
WHERE fecha_entrega BETWEEN '2026-03-01' AND '2026-03-31';

-- 6. Ilustraciones de animacion o cuyo titulo contenga la palabra "Retrato"
SELECT titulo, artista, tipo_arte
FROM ilustraciones_basico
WHERE tipo_arte = 'animacion' OR titulo LIKE '%Retrato%';
