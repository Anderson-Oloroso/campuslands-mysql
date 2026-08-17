USE campuslands_mysql;

-- 1. Consulta base solicitada en el enunciado (Promedios por categoría)
SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio FROM intermedio_ejercicio_013 GROUP BY categoria ORDER BY promedio DESC;

-- 2. Uso de la tabla puente: Ver cada película con sus respectivas etiquetas de terror
SELECT p.nombre, e.nombre_etiqueta FROM intermedio_ejercicio_013 p JOIN pelicula_etiqueta pe ON p.id = pe.id_pelicula JOIN etiquetas_miedo e ON pe.id_etiqueta = e.id_etiqueta;

-- 3. Conteo de cuántas películas tiene asignadas cada etiqueta de terror
SELECT e.nombre_etiqueta, COUNT(pe.id_pelicula) AS total_peliculas FROM etiquetas_miedo e LEFT JOIN pelicula_etiqueta pe ON e.id_etiqueta = pe.id_etiqueta GROUP BY e.nombre_etiqueta;

-- 4. Filtrar por tabla puente: Obtener solo las películas que tienen la etiqueta 'Fantasmas'
SELECT p.nombre, p.puntaje, p.estado FROM intermedio_ejercicio_013 p JOIN pelicula_etiqueta pe ON p.id = pe.id_pelicula JOIN etiquetas_miedo e ON pe.id_etiqueta = e.id_etiqueta WHERE e.nombre_etiqueta = 'Fantasmas';

-- 5. Top 3 películas activas con mayor puntaje (Validación de negocio)
SELECT nombre, categoria, puntaje FROM intermedio_ejercicio_013 WHERE estado = 'activo' ORDER BY puntaje DESC LIMIT 3;