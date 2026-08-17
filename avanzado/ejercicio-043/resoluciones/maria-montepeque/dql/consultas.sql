USE campuslands_mysql;

-- 1. Extraer la recaudacion de cada pelicula con el operador ->>
SELECT titulo, detalles ->> '$.taquilla.recaudacion' AS recaudacion
FROM peliculas_avanzado
ORDER BY titulo;

-- 2. Peliculas en las que actua "Elena Vidal" (JSON_CONTAINS)
SELECT titulo, subgenero
FROM peliculas_avanzado
WHERE JSON_CONTAINS(detalles -> '$.actores', '"Elena Vidal"')
ORDER BY titulo;

-- 3. Expandir el arreglo de actores en filas individuales (JSON_TABLE)
SELECT p.titulo, a.actor
FROM peliculas_avanzado p,
JSON_TABLE(
  p.detalles, '$.actores[*]'
  COLUMNS (actor VARCHAR(120) PATH '$')
) AS a
ORDER BY p.titulo, a.actor;

-- 4. Cantidad de actores y de criticas por pelicula (JSON_LENGTH)
SELECT titulo,
       JSON_LENGTH(detalles -> '$.actores') AS total_actores,
       JSON_LENGTH(detalles -> '$.criticas') AS total_criticas
FROM peliculas_avanzado
ORDER BY total_actores DESC;

-- 5. Peliculas con mas de una critica registrada
SELECT titulo, JSON_LENGTH(detalles -> '$.criticas') AS total_criticas
FROM peliculas_avanzado
WHERE JSON_LENGTH(detalles -> '$.criticas') > 1
ORDER BY total_criticas DESC;

-- 6. Confirmar que a "Cuarentena Cero" se le agrego la critica con JSON_ARRAY_APPEND
SELECT titulo, JSON_PRETTY(detalles -> '$.criticas') AS criticas
FROM peliculas_avanzado
WHERE titulo = 'Cuarentena Cero';

-- 7. Expandir criticas (objetos anidados dentro de un arreglo) con JSON_TABLE
SELECT p.titulo, c.critico, c.puntuacion
FROM peliculas_avanzado p,
JSON_TABLE(
  p.detalles, '$.criticas[*]'
  COLUMNS (
    critico VARCHAR(80) PATH '$.critico',
    puntuacion DECIMAL(3,1) PATH '$.puntuacion'
  )
) AS c
ORDER BY p.titulo, c.puntuacion DESC;
