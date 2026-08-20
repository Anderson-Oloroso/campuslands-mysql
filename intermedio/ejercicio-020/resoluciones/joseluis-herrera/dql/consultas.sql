USE campuslands_mysql;


SELECT
    nombre_cliente AS cliente,
    estilo,
    precio
FROM tatuajes
WHERE precio > (
    SELECT AVG(precio)
    FROM tatuajes
)
ORDER BY precio DESC;


SELECT
    nombre_cliente AS cliente,
    estilo,
    tamano_cm AS tamano,
    precio
FROM tatuajes
WHERE tamano_cm > (
    SELECT AVG(tamano_cm)
    FROM tatuajes
)
ORDER BY tamano DESC;


SELECT
    nombre_cliente AS cliente,
    nombre_tatuador AS tatuador,
    estilo,
    precio
FROM tatuajes
WHERE precio = (
    SELECT MAX(precio)
    FROM tatuajes
);


SELECT
    nombre_cliente AS cliente,
    nombre_tatuador AS tatuador,
    estilo,
    precio
FROM tatuajes
WHERE nombre_tatuador IN (
    SELECT DISTINCT nombre_tatuador
    FROM tatuajes
    WHERE estilo = 'Realismo'
)
ORDER BY nombre_tatuador, precio DESC;


SELECT
    nombre_cliente AS cliente,
    nombre_tatuador AS tatuador,
    estilo,
    precio
FROM tatuajes
WHERE precio > (
    SELECT AVG(precio)
    FROM tatuajes
    WHERE nombre_tatuador = 'Diego Vargas'
)
ORDER BY precio DESC;


SELECT
    nombre_cliente AS cliente,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE estado = 'Completada'
  AND precio > (
      SELECT AVG(precio)
      FROM tatuajes
      WHERE estado = 'Completada'
  )
ORDER BY precio DESC;

SELECT
    nombre_cliente AS cliente,
    estilo,
    precio
FROM tatuajes
WHERE estilo = (
    SELECT estilo
    FROM tatuajes
    GROUP BY estilo
    ORDER BY AVG(precio) DESC
    LIMIT 1
)
ORDER BY precio DESC;