USE academia_basico_db;

-- Consulta 1: Listado de cursos filtrados estrictamente por estado 'Activo'
SELECT 
    nombre_curso AS 'Curso',
    categoria AS 'Categoría',
    duracion_horas AS 'Duración (Horas)',
    costo AS 'Costo ($)'
FROM cursos_academia
WHERE estado = 'Activo'
ORDER BY costo DESC;

-- Consulta 2: Conteo de cursos y costo promedio agrupados por estado
SELECT 
    estado AS 'Estado del Curso',
    COUNT(*) AS 'Total de Cursos',
    AVG(costo) AS 'Costo Promedio'
FROM cursos_academia
GROUP BY estado;

-- Consulta 3: Top 3 de cursos más costosos de la academia (Ranking)
SELECT 
    nombre_curso AS 'Curso Destacado',
    categoria AS 'Categoría',
    costo AS 'Costo Máximo'
FROM cursos_academia
ORDER BY costo DESC
LIMIT 3;

-- Consulta 4: Filtrar cursos que duren más de 35 horas y cuyo estado sea Activo o Pausado
SELECT 
    nombre_curso AS 'Curso',
    duracion_horas AS 'Horas',
    estado AS 'Estado'
FROM cursos_academia
WHERE duracion_horas > 35 AND estado IN ('Activo', 'Pausado')
ORDER BY duracion_horas ASC;

-- Consulta 5: Resumen total de inversión agrupado por la categoría y filtrando activos
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Cursos Activos',
    SUM(costo) AS 'Inversión Total'
FROM cursos_academia
WHERE estado = 'Activo'
GROUP BY categoria
ORDER BY 'Inversión Total' DESC;
