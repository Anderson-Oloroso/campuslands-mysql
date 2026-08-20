USE campuslands_mysql;

-- 1. Consultar todos los cursos activos.
SELECT
    id_curso,
    nombre,
    categoria,
    instructor,
    modalidad,
    precio,
    fecha_inicio
FROM cursos
WHERE estado = 'activo'
ORDER BY fecha_inicio ASC;


-- 2. Consultar los cursos pendientes.
SELECT
    id_curso,
    nombre,
    categoria,
    instructor,
    precio,
    fecha_inicio
FROM cursos
WHERE estado = 'pendiente'
ORDER BY fecha_inicio ASC;


-- 3. Consultar los cursos inactivos.
SELECT
    id_curso,
    nombre,
    categoria,
    instructor,
    precio,
    fecha_inicio
FROM cursos
WHERE estado = 'inactivo'
ORDER BY nombre ASC;


-- 4. Contar cursos agrupados por estado.
SELECT
    estado,
    COUNT(*) AS total_cursos
FROM cursos
GROUP BY estado
ORDER BY total_cursos DESC;


-- 5. Consultar los cursos activos cuyo precio
-- sea superior al precio promedio de todos los cursos.
SELECT
    id_curso,
    nombre,
    categoria,
    precio,
    estado
FROM cursos
WHERE estado = 'activo'
  AND precio > (
      SELECT AVG(precio)
      FROM cursos
  )
ORDER BY precio DESC;