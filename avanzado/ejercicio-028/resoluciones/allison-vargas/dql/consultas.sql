USE academia_tech_json_db;

-- Consulta 1: Extracción de nivel y horas de práctica desde la columna JSON usando el operador ->>
SELECT 
    nombre_completo AS 'Estudiante',
    carrera AS 'Carrera',
    metadata_json->>'$.nivel' AS 'Nivel Técnico',
    metadata_json->>'$.horas_practica' AS 'Horas de Práctica'
FROM detalles_estudiantes
WHERE estado = 'Activo';

-- Consulta 2: Filtrar estudiantes cuyo nivel dentro del JSON sea 'Avanzado'
SELECT 
    nombre_completo AS 'Estudiante Avanzado',
    correo AS 'Correo Electrónico',
    metadata_json->>'$.horas_practica' AS 'Horas Acumuladas'
FROM detalles_estudiantes
WHERE metadata_json->>'$.nivel' = 'Avanzado';

-- Consulta 3: Agrupación y conteo según el nivel extraído del documento JSON
SELECT 
    metadata_json->>'$.nivel' AS 'Nivel de Especialización',
    COUNT(*) AS 'Total de Estudiantes',
    AVG(CAST(metadata_json->>'$.horas_practica' AS UNSIGNED)) AS 'Promedio Horas Práctica'
FROM detalles_estudiantes
GROUP BY metadata_json->>'$.nivel';

-- Consulta 4: Top 3 de estudiantes con mayor cantidad de horas de práctica en el JSON
SELECT 
    nombre_completo AS 'Estudiante',
    carrera AS 'Carrera',
    CAST(metadata_json->>'$.horas_practica' AS UNSIGNED) AS 'Horas'
FROM detalles_estudiantes
ORDER BY CAST(metadata_json->>'$.horas_practica' AS UNSIGNED) DESC
LIMIT 3;

-- Consulta 5: Validación de estudiantes activos agrupados por carrera y su promedio de horas JSON
SELECT 
    carrera AS 'Carrera',
    COUNT(*) AS 'Estudiantes Activos',
    AVG(CAST(metadata_json->>'$.horas_practica' AS UNSIGNED)) AS 'Promedio Horas'
FROM detalles_estudiantes
WHERE estado = 'Activo'
GROUP BY carrera
ORDER BY 'Promedio Horas' DESC;
