USE campuslands_mysql;

-- 1. Ranking de personajes activos ordenados por nivel y puntos de vida de mayor a menor
SELECT nombre_personaje, clase, nivel, puntos_vida, experiencia 
FROM personajes_rpg_intermedio 
WHERE estado = 'activo'
ORDER BY nivel DESC, puntos_vida DESC;

-- 2. Resumen por clase de personaje: Total de integrantes, nivel promedio y vida promedio
SELECT clase, COUNT(*) AS total_personajes, AVG(nivel) AS nivel_promedio, AVG(puntos_vida) AS vida_promedio
FROM personajes_rpg_intermedio
GROUP BY clase
ORDER BY nivel_promedio DESC;

-- 3. Personajes inactivos o baneados ordenados por fecha de creación
SELECT nombre_personaje, clase, estado, creado_en 
FROM personajes_rpg_intermedio 
WHERE estado IN ('inactivo', 'baneado')
ORDER BY creado_en ASC;

-- 4. Top 3 personajes con mayor experiencia acumulada sin importar su estado
SELECT nombre_personaje, clase, nivel, experiencia 
FROM personajes_rpg_intermedio 
ORDER BY experiencia DESC 
LIMIT 3;

-- 5. Listado general de personajes organizado alfabéticamente por nombre
SELECT nombre_personaje, clase, nivel, puntos_vida, experiencia, estado 
FROM personajes_rpg_intermedio 
ORDER BY nombre_personaje ASC;