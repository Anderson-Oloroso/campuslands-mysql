USE campuslands_mysql;

SELECT
    id_curso,
    nombre,
    categoria,
    nivel,
    precio,
    estado
FROM cursos_academia
WHERE estado = 'activo'
ORDER BY nombre;

SELECT
    id_curso,
    nombre,
    categoria,
    nivel,
    estado
FROM cursos_academia
WHERE estado = 'inactivo'
ORDER BY nombre;

SELECT
    nombre,
    categoria,
    nivel,
    duracion_horas,
    precio
FROM cursos_academia
WHERE estado = 'activo'
  AND nivel = 'intermedio'
ORDER BY precio DESC;