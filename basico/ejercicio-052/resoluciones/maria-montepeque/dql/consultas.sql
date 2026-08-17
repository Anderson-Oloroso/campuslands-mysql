USE campuslands_mysql;

-- 1. Renders ordenados por calidad, de mejor a peor
SELECT proyecto, motor_render, resolucion, calidad_puntaje
FROM renders_estudio_basico
ORDER BY calidad_puntaje DESC;

-- 2. Renders ordenados por tiempo de render, del mas rapido al mas lento
SELECT proyecto, resolucion, tiempo_render_min
FROM renders_estudio_basico
ORDER BY tiempo_render_min ASC;

-- 3. Orden por motor de render y, dentro de cada motor, por calidad descendente
SELECT motor_render, proyecto, calidad_puntaje
FROM renders_estudio_basico
ORDER BY motor_render ASC, calidad_puntaje DESC;

-- 4. Orden por una expresion calculada: horas de render en vez de minutos
SELECT proyecto, tiempo_render_min, ROUND(tiempo_render_min / 60, 2) AS horas_render
FROM renders_estudio_basico
ORDER BY horas_render DESC;

-- 5. Top 3 renders con mejor calidad
SELECT proyecto, motor_render, calidad_puntaje
FROM renders_estudio_basico
ORDER BY calidad_puntaje DESC
LIMIT 3;

-- 6. Orden logico por resolucion (no alfabetico) usando FIELD():
-- alfabeticamente '1080p' quedaria antes que '4K', pero en calidad real
-- el orden correcto es 720p < 1080p < 2K < 4K < 8K.
SELECT proyecto, resolucion, tiempo_render_min
FROM renders_estudio_basico
ORDER BY FIELD(resolucion, '720p', '1080p', '2K', '4K', '8K');
