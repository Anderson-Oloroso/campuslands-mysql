USE campuslands_mysql;

-- 1. Jugadores ordenados por goles de mayor a menor
SELECT nombre, equipo, goles
FROM jugadores_basico
ORDER BY goles DESC;

-- 2. Jugadores ordenados por salario de menor a mayor
SELECT nombre, equipo, salario
FROM jugadores_basico
ORDER BY salario ASC;

-- 3. Jugadores de un equipo especifico ordenados por edad
SELECT nombre, posicion, edad
FROM jugadores_basico
WHERE equipo = 'Aguilas Doradas'
ORDER BY edad ASC;

-- 4. Top 5 goleadores de la liga
SELECT nombre, equipo, goles
FROM jugadores_basico
ORDER BY goles DESC
LIMIT 5;

-- 5. Jugadores ordenados por posicion y, dentro de cada posicion, por goles descendente
SELECT posicion, nombre, goles
FROM jugadores_basico
ORDER BY posicion ASC, goles DESC;

-- 6. Jugadores activos ordenados por salario descendente
SELECT nombre AS jugador, equipo, salario AS salario_mensual
FROM jugadores_basico
WHERE estado = 'activo'
ORDER BY salario DESC;
