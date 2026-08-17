-- DQL: Consultas con la cláusula WHERE para filtrar la información
USE campuslands_mysql;

-- 1. Proyectos completados que requirieron más de 15 horas de trabajo
SELECT 
    codigo_proyecto,
    artista_nombre,
    software,
    tiempo_horas,
    estado
FROM proyectos_dibujo
WHERE estado = 'completado' AND tiempo_horas > 15.00
ORDER BY tiempo_horas DESC;

-- 2. Proyectos realizados en software sin costo de licencia (Software Libre / Gratuito)
SELECT 
    codigo_proyecto,
    artista_nombre,
    software,
    estilo,
    costo_licencia_usd
FROM proyectos_dibujo
WHERE costo_licencia_usd = 0.00
ORDER BY artista_nombre ASC;

-- 3. Búsqueda por rango de tiempo invertido entre 10 y 30 horas
SELECT 
    codigo_proyecto,
    artista_nombre,
    estilo,
    tiempo_horas
FROM proyectos_dibujo
WHERE tiempo_horas BETWEEN 10.00 AND 30.00
ORDER BY tiempo_horas ASC;

-- 4. Filtrado por estilos específicos de alta demanda ('Concept Art' o 'Anime/Manga')
SELECT 
    codigo_proyecto,
    artista_nombre,
    software,
    estilo,
    estado
FROM proyectos_dibujo
WHERE estilo IN ('Concept Art', 'Anime/Manga') AND estado != 'pausado'
ORDER BY estilo ASC;

-- 5. Proyectos iniciados a partir de la segunda semana de julio de 2026
SELECT 
    codigo_proyecto,
    artista_nombre,
    software,
    fecha_inicio
FROM proyectos_dibujo
WHERE fecha_inicio >= '2026-07-08'
ORDER BY fecha_inicio ASC;
