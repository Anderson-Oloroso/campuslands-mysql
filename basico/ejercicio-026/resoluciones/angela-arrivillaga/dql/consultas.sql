USE rpg_videojuego_db;

-- 1. Validar y consultar personajes activos que superen el nivel 80, ordenados por nivel de forma descendente
SELECT codigo_personaje, nombre_personaje, clase_personaje, nivel_actual, experiencia_acumulada, estado_jugador
FROM personajes_rpg
WHERE estado_jugador = 'activo' AND nivel_actual > 80
ORDER BY nivel_actual DESC;

-- 2. Validar rangos de experiencia consultando personajes cuya experiencia se encuentre entre 300,000 y 600,000 puntos (operador BETWEEN)
SELECT codigo_personaje, nombre_personaje, clase_personaje, nivel_actual, experiencia_acumulada
FROM personajes_rpg
WHERE experiencia_acumulada BETWEEN 300000 AND 600000
ORDER BY experiencia_acumulada ASC;

-- 3. Validar pertenencia a clases específicas mediante el operador IN (Mago o Guerrero) y filtrar por nivel alto
SELECT codigo_personaje, nombre_personaje, clase_personaje, nivel_actual, estado_jugador
FROM personajes_rpg
WHERE clase_personaje IN ('Mago', 'Guerrero')
ORDER BY nivel_actual DESC;

-- 4. Validar exclusión de estados mediante NOT IN para obtener jugadores que no están inactivos ni baneados
SELECT codigo_personaje, nombre_personaje, clase_personaje, nivel_actual, estado_jugador
FROM personajes_rpg
WHERE estado_jugador NOT IN ('inactivo', 'baneado')
ORDER BY nivel_actual DESC;

-- 5. Consulta de reporte validando rangos de nivel y calculando un indicador analítico (promedio de experiencia por clase)
SELECT 
    clase_personaje,
    COUNT(*) AS total_personajes_clase,
    MAX(nivel_actual) AS nivel_maximo_clase,
    SUM(experiencia_acumulada) AS experiencia_total_clase
FROM personajes_rpg
WHERE nivel_actual >= 75
GROUP BY clase_personaje
ORDER BY experiencia_total_clase DESC;