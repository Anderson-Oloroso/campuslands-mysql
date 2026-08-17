USE campuslands_mysql;


-- 1. Mostrar tatuajes cuyo precio sea superior al precio promedio
-- de todos los tatuajes.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE precio > (
    SELECT AVG(precio)
    FROM tatuajes
)
ORDER BY precio DESC;


-- 2. Mostrar el tatuaje o tatuajes con el precio más alto.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE precio = (
    SELECT MAX(precio)
    FROM tatuajes
)
ORDER BY nombre_cliente ASC;


-- 3. Mostrar tatuajes con una duración superior a la duración promedio.
SELECT
    nombre_cliente,
    estilo,
    duracion_horas,
    precio
FROM tatuajes
WHERE duracion_horas > (
    SELECT AVG(duracion_horas)
    FROM tatuajes
)
ORDER BY duracion_horas DESC;


-- 4. Mostrar los tatuajes realizados cuyo precio sea superior
-- al precio promedio de los tatuajes realizados.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE estado = 'realizado'
  AND precio > (
      SELECT AVG(precio)
      FROM tatuajes
      WHERE estado = 'realizado'
  )
ORDER BY precio DESC;


-- 5. Mostrar los tatuajes cuyo precio sea superior al precio
-- promedio de su propio estilo.
SELECT
    t.nombre_cliente,
    t.estilo,
    t.precio
FROM tatuajes AS t
WHERE t.precio > (
    SELECT AVG(t2.precio)
    FROM tatuajes AS t2
    WHERE t2.estilo = t.estilo
)
ORDER BY t.estilo ASC, t.precio DESC;


-- 6. Mostrar los tatuajes realizados por artistas que tienen
-- al menos un tatuaje con precio superior a 1000.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE estado = 'realizado'
  AND nombre_artista IN (
      SELECT DISTINCT nombre_artista
      FROM tatuajes
      WHERE precio > 1000
  )
ORDER BY precio DESC;


-- 7. Mostrar los tatuajes cuyo precio sea mayor que todos
-- los tatuajes minimalistas.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE precio > ALL (
    SELECT precio
    FROM tatuajes
    WHERE estilo = 'Minimalista'
)
ORDER BY precio DESC;