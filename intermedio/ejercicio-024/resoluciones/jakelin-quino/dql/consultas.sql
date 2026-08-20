-- 1. Ver todos los materiales
SELECT * FROM `ejercicio-024-int-materiales`;

-- 2. Ver todos los proyectos
SELECT * FROM `ejercicio-024-int-proyectos`;

-- 3. Proyectos con su material
SELECT p.nombre AS proyecto, m.nombre AS material, p.temperatura
FROM `ejercicio-024-int-proyectos` p
INNER JOIN `ejercicio-024-int-materiales` m ON p.material_id = m.id;