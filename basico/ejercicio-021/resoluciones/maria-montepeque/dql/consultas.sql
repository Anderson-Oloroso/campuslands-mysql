USE campuslands_mysql;

-- 1. Proyectos entregados (WHERE con igualdad)
SELECT titulo, artista, precio, fecha_entrega
FROM proyectos_basico
WHERE estado = 'entregado'
ORDER BY fecha_entrega;

-- 2. Proyectos de un artista especifico
SELECT titulo, tipo_arte, estado
FROM proyectos_basico
WHERE artista = 'Lucia Nieto';

-- 3. Proyectos con precio mayor a 200 y que no esten entregados
SELECT titulo, artista, precio, estado
FROM proyectos_basico
WHERE precio > 200 AND estado <> 'entregado';

-- 4. Proyectos hechos en Photoshop o Procreate
SELECT titulo, artista, software_principal
FROM proyectos_basico
WHERE software_principal IN ('Photoshop', 'Procreate');

-- 5. Proyectos con entrega programada en marzo de 2026
SELECT titulo, artista, fecha_entrega
FROM proyectos_basico
WHERE fecha_entrega BETWEEN '2026-03-01' AND '2026-03-31';

-- 6. Proyectos de pixel art o cuyo titulo contenga la palabra "Comic"
SELECT titulo, artista, tipo_arte
FROM proyectos_basico
WHERE tipo_arte = 'pixel_art' OR titulo LIKE '%Comic%';
