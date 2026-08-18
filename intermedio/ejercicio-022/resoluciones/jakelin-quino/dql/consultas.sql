-- 1. Ver todos los estudios
SELECT * FROM `ejercicio-022-int-estudios`;

-- 2. Proyectos con su estudio
SELECT p.nombre AS proyecto, e.nombre AS estudio, p.presupuesto
FROM `ejercicio-022-int-proyectos` p
INNER JOIN `ejercicio-022-int-estudios` e ON p.estudio_id = e.id;

-- 3. Personajes con su proyecto y estudio
SELECT pe.nombre AS personaje, p.nombre AS proyecto, e.nombre AS estudio
FROM `ejercicio-022-int-personajes` pe
INNER JOIN `ejercicio-022-int-proyectos` p ON pe.proyecto_id = p.id
INNER JOIN `ejercicio-022-int-estudios` e ON p.estudio_id = e.id;