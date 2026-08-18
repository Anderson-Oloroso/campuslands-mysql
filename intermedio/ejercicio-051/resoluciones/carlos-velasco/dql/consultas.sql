USE campuslands_mysql;

-- 1. Mostrar todas las ilustraciones ordenadas por título.
SELECT
    id_ilustracion,
    titulo,
    artista,
    tecnica,
    programa,
    formato,
    estado
FROM ilustraciones
ORDER BY titulo ASC;


-- 2. Mostrar las ilustraciones finalizadas.
SELECT
    titulo,
    artista,
    tecnica,
    programa
FROM ilustraciones
WHERE estado = 'finalizada'
ORDER BY titulo ASC;


-- 3. Contar ilustraciones por programa utilizado.
SELECT
    programa,
    COUNT(*) AS total_ilustraciones
FROM ilustraciones
GROUP BY programa
ORDER BY total_ilustraciones DESC;


-- 4. Contar ilustraciones por técnica.
SELECT
    tecnica,
    COUNT(*) AS total_ilustraciones
FROM ilustraciones
GROUP BY tecnica
ORDER BY total_ilustraciones DESC;


-- 5. Mostrar las ilustraciones con resolución superior a Full HD.
SELECT
    titulo,
    artista,
    resolucion_ancho,
    resolucion_alto,
    formato
FROM ilustraciones
WHERE resolucion_ancho > 1920
  AND resolucion_alto > 1080
ORDER BY resolucion_ancho DESC;


-- 6. Contar ilustraciones según su estado.
SELECT
    estado,
    COUNT(*) AS total_ilustraciones
FROM ilustraciones
GROUP BY estado
ORDER BY total_ilustraciones DESC;


-- 7. Mostrar las ilustraciones realizadas en formato PNG.
SELECT
    titulo,
    artista,
    programa,
    tecnica,
    formato
FROM ilustraciones
WHERE formato = 'PNG'
ORDER BY titulo ASC;