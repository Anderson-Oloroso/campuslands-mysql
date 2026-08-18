-- MOSTRAR LAS PELICULAS CON SU FECHA DE ESTRENO

SELECT
    titulo,
    fecha_estreno
FROM peliculas
ORDER BY fecha_estreno;

-- Mostrar películas estrenadas después de 2015(USAR LA MISMA LOGICA PARA MOSTRAR PELICULAS
-- ANTES DEL 2015 "<")
SELECT
    titulo,
    fecha_estreno
FROM peliculas
WHERE fecha_estreno > '2015-01-01'
ORDER BY fecha_estreno;

-- Mostrar películas estrenadas durante el año 2020
SELECT
    titulo,
    fecha_estreno
FROM peliculas
WHERE fecha_estreno BETWEEN '2020-01-01' AND '2020-12-31';

-- Mostrar las sagas que todavía están activas
SELECT
    nombre,
    fecha_inicio,
    fecha_fin
FROM sagas
WHERE fecha_fin IS NULL;

-- Mostrar los lanzamientos realizados en plataformas de streaming

SELECT
    p.titulo,
    l.plataforma,
    l.fecha_lanzamiento,
    l.hora_lanzamiento
FROM lanzamientos l
INNER JOIN peliculas p
    ON l.id_pelicula = p.id_pelicula
WHERE l.plataforma = 'Streaming'
ORDER BY l.fecha_lanzamiento;


