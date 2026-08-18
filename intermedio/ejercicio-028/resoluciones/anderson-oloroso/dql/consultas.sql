USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.curso_id, t1.nombre_curso, t1.area, t2.nombre_estudiante, t2.email, t2.promedio_nota
FROM cursos_tech t1
INNER JOIN estudiantes_tech t2 ON t1.curso_id = t2.curso_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_curso, COUNT(t2.estudiante_id) AS total_relacionados
FROM cursos_tech t1
LEFT JOIN estudiantes_tech t2 ON t1.curso_id = t2.curso_id
GROUP BY t1.curso_id, t1.nombre_curso;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_curso, AVG(t2.promedio_nota) AS promedio_score
FROM cursos_tech t1
INNER JOIN estudiantes_tech t2 ON t1.curso_id = t2.curso_id
GROUP BY t1.curso_id, t1.nombre_curso
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_estudiante, email, promedio_nota
FROM estudiantes_tech
WHERE promedio_nota > (SELECT AVG(promedio_nota) FROM estudiantes_tech);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_cursos_tech AS
SELECT t1.nombre_curso, t1.area, t2.nombre_estudiante, t2.promedio_nota
FROM cursos_tech t1
INNER JOIN estudiantes_tech t2 ON t1.curso_id = t2.curso_id;

SELECT * FROM vista_reporte_cursos_tech;
