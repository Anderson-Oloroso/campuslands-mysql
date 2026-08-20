-- 1. Cursos activos
SELECT nombre, nivel, duracion FROM `ejercicio-058-bas-cursos`
WHERE estado = 'activo';

-- 2. Cursos finalizados
SELECT nombre, nivel, duracion FROM `ejercicio-058-bas-cursos`
WHERE estado = 'finalizado';

-- 3. Resumen por estado
SELECT estado, COUNT(*) AS total FROM `ejercicio-058-bas-cursos`
GROUP BY estado;