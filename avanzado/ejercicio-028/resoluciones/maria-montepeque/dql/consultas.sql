USE campuslands_mysql;

-- 1. Extraer un campo anidado del JSON con el operador ->>
SELECT nombre, perfil ->> '$.contacto.github' AS usuario_github
FROM estudiantes_avanzado
ORDER BY nombre;

-- 2. Estudiantes que tienen "Python" entre sus habilidades (JSON_CONTAINS)
SELECT nombre, programa
FROM estudiantes_avanzado
WHERE JSON_CONTAINS(perfil -> '$.habilidades', '"Python"')
ORDER BY nombre;

-- 3. Expandir el arreglo de habilidades en filas individuales (JSON_TABLE)
SELECT e.nombre, h.habilidad
FROM estudiantes_avanzado e,
JSON_TABLE(
  e.perfil, '$.habilidades[*]'
  COLUMNS (habilidad VARCHAR(60) PATH '$')
) AS h
ORDER BY e.nombre, h.habilidad;

-- 4. Cantidad de habilidades y de proyectos por estudiante (JSON_LENGTH)
SELECT nombre,
       JSON_LENGTH(perfil -> '$.habilidades') AS total_habilidades,
       JSON_LENGTH(perfil -> '$.proyectos') AS total_proyectos
FROM estudiantes_avanzado
ORDER BY total_habilidades DESC;

-- 5. Estudiantes con mas de un proyecto registrado
SELECT nombre, JSON_LENGTH(perfil -> '$.proyectos') AS total_proyectos
FROM estudiantes_avanzado
WHERE JSON_LENGTH(perfil -> '$.proyectos') > 1
ORDER BY total_proyectos DESC;

-- 6. Confirmar que a Andres Castro se le agrego el proyecto con JSON_ARRAY_APPEND
SELECT nombre, JSON_PRETTY(perfil -> '$.proyectos') AS proyectos
FROM estudiantes_avanzado
WHERE nombre = 'Andres Castro';

-- 7. Expandir proyectos (objetos anidados dentro de un arreglo) con JSON_TABLE
SELECT e.nombre, p.proyecto, p.tecnologia
FROM estudiantes_avanzado e,
JSON_TABLE(
  e.perfil, '$.proyectos[*]'
  COLUMNS (
    proyecto VARCHAR(120) PATH '$.nombre',
    tecnologia VARCHAR(80) PATH '$.tecnologia'
  )
) AS p
ORDER BY e.nombre;
