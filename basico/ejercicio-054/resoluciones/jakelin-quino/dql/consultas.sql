-- 1. Ver proyectos antes de eliminar
SELECT * FROM `ejercicio-054-bas-proyectos`;

-- 2. Eliminar proyectos cancelados
DELETE FROM `ejercicio-054-bas-proyectos` WHERE estado = 'cancelado';

-- 3. Ver proyectos después de eliminar
SELECT * FROM `ejercicio-054-bas-proyectos`;