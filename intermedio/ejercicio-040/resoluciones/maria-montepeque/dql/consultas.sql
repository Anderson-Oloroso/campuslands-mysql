USE campuslands_mysql;

-- 1. Listado de carreras con su codigo unico
SELECT id_carrera, codigo_carrera, nombre_carrera, distancia_km, ciudad
FROM carreras_intermedio
ORDER BY codigo_carrera;

-- 2. Evidencia de que el dorsal '101' se repite entre carreras distintas (permitido)
SELECT c.codigo_carrera, d.numero_dorsal, d.corredor
FROM dorsales_carrera_intermedio d
INNER JOIN carreras_intermedio c ON c.id_carrera = d.id_carrera
WHERE d.numero_dorsal = '101'
ORDER BY c.codigo_carrera;

-- 3. Cantidad de corredores inscritos por carrera
SELECT c.codigo_carrera, c.nombre_carrera, COUNT(*) AS total_corredores
FROM dorsales_carrera_intermedio d
INNER JOIN carreras_intermedio c ON c.id_carrera = d.id_carrera
GROUP BY c.codigo_carrera, c.nombre_carrera
ORDER BY total_corredores DESC;

-- 4. Carreras agrupadas por ciudad
SELECT ciudad, COUNT(*) AS total_carreras
FROM carreras_intermedio
GROUP BY ciudad
ORDER BY total_carreras DESC;

-- 5. Tiempos registrados por carrera, ordenados por fecha
SELECT c.codigo_carrera, d.corredor, d.tiempo_minutos, c.fecha_carrera
FROM dorsales_carrera_intermedio d
INNER JOIN carreras_intermedio c ON c.id_carrera = d.id_carrera
ORDER BY c.fecha_carrera, d.tiempo_minutos;

-- 6. Carrera con mayor cantidad de corredores inscritos
SELECT c.codigo_carrera, c.nombre_carrera, COUNT(*) AS total_corredores
FROM dorsales_carrera_intermedio d
INNER JOIN carreras_intermedio c ON c.id_carrera = d.id_carrera
GROUP BY c.codigo_carrera, c.nombre_carrera
ORDER BY total_corredores DESC
LIMIT 1;

-- Notas de validacion manual (verificadas al preparar esta resolucion):
--   INSERT INTO carreras_intermedio (codigo_carrera, nombre_carrera, distancia_km, ciudad, fecha_carrera)
--   VALUES ('BOG-10K', 'Otro nombre', 10.00, 'Bogota', '2026-04-01');
--   -> ERROR 1062 (23000): Duplicate entry 'BOG-10K' for key
--      'carreras_intermedio.codigo_carrera'
--
--   INSERT INTO dorsales_carrera_intermedio (id_carrera, numero_dorsal, corredor, tiempo_minutos)
--   VALUES (1, '101', 'Otro Corredor', 50.00);
--   -> ERROR 1062 (23000): Duplicate entry '1-101' for key
--      'dorsales_carrera_intermedio.uq_dorsales_carrera_intermedio'
-- (no se ejecutan aqui para no interrumpir el script).
