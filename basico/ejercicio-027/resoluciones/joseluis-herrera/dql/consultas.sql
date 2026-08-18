USE campuslands_mysql;

SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    salud,
    ataque,
    estado
FROM personajes
ORDER BY nombre;


SELECT
    nombre,
    clase,
    nivel
FROM personajes
WHERE estado = 'activo'
ORDER BY nivel DESC;

SELECT
    nombre,
    nivel,
    ataque
FROM personajes
WHERE clase = 'Guerrero'
ORDER BY nivel DESC;


SELECT
    clase,
    AVG(salud) AS promedio_salud
FROM personajes
GROUP BY clase
ORDER BY promedio_salud DESC;

SELECT
    nombre,
    clase,
    ataque
FROM personajes
ORDER BY ataque DESC
LIMIT 5;

SELECT
    estado,
    COUNT(*) AS total_personajes
FROM personajes
GROUP BY estado;

SELECT
    nombre,
    clase,
    nivel
FROM personajes
WHERE nivel > 20
ORDER BY nivel DESC;