USE saga_ciencia_ficcion;

SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas
ORDER BY fecha_estreno ASC;

SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas
WHERE fecha_estreno > '2020-01-01'
ORDER BY fecha_estreno ASC;

SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas
WHERE fecha_estreno BETWEEN '2017-01-01' AND '2023-12-31'
ORDER BY fecha_estreno ASC;

SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas
ORDER BY fecha_estreno ASC
LIMIT 1;

SELECT
    titulo,
    episodio,
    fecha_estreno
FROM peliculas
ORDER BY fecha_estreno DESC
LIMIT 1;