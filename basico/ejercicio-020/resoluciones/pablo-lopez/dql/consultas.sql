USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1
-- Mostrar todos los tatuajes registrados con información
-- relevante del cliente, tatuador, estilo, precio y estado.
-- =========================================================

SELECT
    id_tatuaje,
    cliente,
    tatuador,
    estilo,
    tamano_cm,
    precio,
    fecha_cita,
    estado
FROM tatuajes;


-- =========================================================
-- CONSULTA 2
-- Mostrar únicamente los tatuajes que están pendientes.
-- =========================================================

SELECT
    id_tatuaje,
    cliente,
    tatuador,
    estilo,
    precio,
    fecha_cita
FROM tatuajes
WHERE estado = 'pendiente';


-- =========================================================
-- CONSULTA 3
-- Mostrar los tatuajes ordenados de mayor a menor precio.
-- =========================================================

SELECT
    id_tatuaje,
    cliente,
    estilo,
    precio,
    estado
FROM tatuajes
ORDER BY precio DESC;


-- =========================================================
-- CONSULTA 4
-- Mostrar los tatuajes cuyo precio sea superior a Q500.
-- =========================================================

SELECT
    id_tatuaje,
    cliente,
    estilo,
    tamano_cm,
    precio
FROM tatuajes
WHERE precio > 500
ORDER BY precio DESC;


-- =========================================================
-- CONSULTA 5
-- Calcular el precio promedio de los tatuajes registrados.
-- =========================================================

SELECT
    AVG(precio) AS precio_promedio
FROM tatuajes;


-- =========================================================
-- CONSULTA 6
-- Mostrar la cantidad de tatuajes registrados por cada estilo.
-- =========================================================

SELECT
    estilo,
    COUNT(*) AS total_tatuajes
FROM tatuajes
GROUP BY estilo
ORDER BY total_tatuajes DESC;


-- =========================================================
-- CONSULTA 7
-- Mostrar los 5 tatuajes de mayor precio.
-- =========================================================

SELECT
    id_tatuaje,
    cliente,
    tatuador,
    estilo,
    precio
FROM tatuajes
ORDER BY precio DESC
LIMIT 5;