-- Mostrar únicamente las películas disponibles
SELECT
    titulo,
    anio_lanzamiento,
    duracion_minutos,
    estado
FROM peliculas
WHERE estado = 'Disponible';
-- Mostrar películas que no están disponibles
SELECT
    titulo,
    estado
FROM peliculas
WHERE estado = 'No disponible';

-- Mostrar películas próximas a estar disponibles
SELECT
    titulo,
    anio_lanzamiento,
    estado
FROM peliculas
WHERE estado = 'Proximamente';

-- Mostrar películas disponibles con duración mayor a 100 minutos
SELECT
    titulo,
    duracion_minutos,
    estado
FROM peliculas
WHERE estado = 'Disponible'
AND duracion_minutos > 100;

-- Mostrar películas disponibles junto con su director

SELECT
    p.titulo,
    d.nombre AS director,
    p.anio_lanzamiento,
    p.estado
FROM peliculas p
INNER JOIN directores d
    ON p.id_director = d.id_director
WHERE p.estado = 'Disponible';

-- Contar películas según su estado
SELECT
    estado,
    COUNT(*) AS cantidad_peliculas
FROM peliculas
GROUP BY estado;

-- Mostrar el presupuesto promedio de las películas disponibles

SELECT
    AVG(presupuesto) AS presupuesto_promedio
FROM peliculas
WHERE estado = 'Disponible';


