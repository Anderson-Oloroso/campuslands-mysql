USE campuslands_mysql;

-- 1. Estado final de todos los jugadores, tras los cuatro UPDATE
SELECT id_jugador, nombre, equipo, goles, precio_ficha, categoria, estado
FROM jugadores_futsal_basico
ORDER BY id_jugador;

-- 2. Jugadores lesionados
SELECT nombre, equipo, estado
FROM jugadores_futsal_basico
WHERE estado = 'lesionado';

-- 3. Precio de ficha de los jugadores con mas de 5 goles, ya con el incremento del 10%
SELECT nombre, goles, precio_ficha
FROM jugadores_futsal_basico
WHERE goles > 5;

-- 4. Jugadores activos sin tarjetas amarillas (incluye a los que cumplieron sancion)
SELECT nombre, equipo, tarjetas_amarillas, estado
FROM jugadores_futsal_basico
WHERE tarjetas_amarillas = 0 AND estado = 'activo';

-- 5. Cantidad de jugadores por categoria
SELECT categoria, COUNT(*) AS total
FROM jugadores_futsal_basico
GROUP BY categoria
ORDER BY total DESC;

-- 6. Jugadores por equipo con su categoria asignada
SELECT equipo, nombre, categoria
FROM jugadores_futsal_basico
ORDER BY equipo, categoria;
