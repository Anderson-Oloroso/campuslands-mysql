USE campuslands_mysql;

-- 1. Ranking de personajes activos ordenados por nivel de mayor a menor
SELECT nombre_personaje, clase, nivel, experiencia 
FROM personajes_rpg 
WHERE estado = 'activo'
ORDER BY nivel DESC, experiencia DESC;

-- 2. Resumen por clase de personaje: Total de integrantes, nivel promedio y experiencia acumulada
SELECT clase, COUNT(*) AS total_personajes, AVG(nivel) AS nivel_promedio, SUM(experiencia) AS experiencia_total
FROM personajes_rpg
GROUP BY clase
ORDER BY experiencia_total DESC;

-- 3. Personajes inactivos o baneados ordenados por fecha de creación
SELECT nombre_personaje, clase, estado, creado_en 
FROM personajes_rpg 
WHERE estado IN ('inactivo', 'baneado')
ORDER BY creado_en ASC;

-- 4. Top 3 personajes con mayor experiencia acumulada sin importar su estado
SELECT nombre_personaje, clase, nivel, experiencia 
FROM personajes_rpg 
ORDER BY experiencia DESC 
LIMIT 3;

-- 5. Listado general de personajes organizado alfabéticamente por nombre
SELECT nombre_personaje, clase, nivel, experiencia, estado 
FROM personajes_rpg 
ORDER BY nombre_personaje ASC;