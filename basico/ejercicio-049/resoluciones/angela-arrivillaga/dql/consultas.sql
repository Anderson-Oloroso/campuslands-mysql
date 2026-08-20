USE campuslands_mysql;

-- 1. promedio de calificacion de aterrizaje por saltos completados
SELECT estado, AVG(calificacion_aterrizaje) AS promedio_calificacion
FROM saltos_paracaidismo
WHERE estado = 'completado'
GROUP BY estado;

-- 2. top 3 saltos con mayor altura de salida
SELECT paracaidista, altura_pies, duracion_caida_segundos, calificacion_aterrizaje
FROM saltos_paracaidismo
WHERE estado = 'completado'
ORDER BY altura_pies DESC
LIMIT 3;

-- 3. listado de saltos realizados por un paracaidista especifico
SELECT paracaidista, altura_pies, duracion_caida_segundos, calificacion_aterrizaje, estado
FROM saltos_paracaidismo
WHERE paracaidista = 'carlos mendoza';

-- 4. reporte de saltos agrupados por su estado operativo con conteo total
SELECT estado, COUNT(*) AS total_saltos, AVG(altura_pies) AS altura_promedio
FROM saltos_paracaidismo
GROUP BY estado;

-- 5. saltos completados con calificacion superior a 9.0 ordenados por duracion de caída
SELECT paracaidista, altura_pies, duracion_caida_segundos, calificacion_aterrizaje
FROM saltos_paracaidismo
WHERE estado = 'completado' AND calificacion_aterrizaje > 9.0
ORDER BY duracion_caida_segundos DESC;