USE campuslands_mysql;

-- 1. Mostrar todas las películas ordenadas por fecha de estreno.
SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno ASC;


-- 2. Mostrar las películas estrenadas después del año 2000.
SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas_ciencia_ficcion
WHERE fecha_estreno >= '2000-01-01'
ORDER BY fecha_estreno ASC;


-- 3. Mostrar las películas estrenadas durante el mes de mayo.
SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas_ciencia_ficcion
WHERE MONTH(fecha_estreno) = 5
ORDER BY fecha_estreno ASC;


-- 4. Mostrar las películas estrenadas entre 1980 y 2010.
SELECT
    titulo,
    fecha_estreno,
    calificacion
FROM peliculas_ciencia_ficcion
WHERE fecha_estreno BETWEEN '1980-01-01' AND '2010-12-31'
ORDER BY fecha_estreno ASC;


-- 5. Obtener la película más antigua de la saga.
SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno ASC
LIMIT 1;


-- 6. Obtener la película más reciente de la saga.
SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno DESC
LIMIT 1;


-- 7. Mostrar las películas estrenadas antes de 2000 que están disponibles.
SELECT
    titulo,
    fecha_estreno,
    estado
FROM peliculas_ciencia_ficcion
WHERE fecha_estreno < '2000-01-01'
  AND estado = 'disponible'
ORDER BY fecha_estreno ASC;