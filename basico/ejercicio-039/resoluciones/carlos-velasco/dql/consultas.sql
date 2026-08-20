USE campuslands_mysql;

-- 1. Consultar todos los peleadores antes del DELETE.
SELECT
    id_peleador,
    nombre,
    categoria,
    edad,
    victorias,
    derrotas,
    estado
FROM peleadores
ORDER BY id_peleador;

-- 2. Identificar los peleadores que serán eliminados.
SELECT
    id_peleador,
    nombre,
    categoria,
    estado
FROM peleadores
WHERE estado = 'retirado';

-- 3. DELETE controlado de peleadores retirados.
DELETE FROM peleadores
WHERE estado = 'retirado';

-- 4. Verificar que los peleadores retirados fueron eliminados.
SELECT
    id_peleador,
    nombre,
    categoria,
    estado
FROM peleadores
ORDER BY id_peleador;

-- 5. Mostrar los peleadores activos.
SELECT
    nombre,
    categoria,
    victorias,
    derrotas
FROM peleadores
WHERE estado = 'activo'
ORDER BY victorias DESC;

-- 6. Obtener los 5 peleadores con más victorias.
SELECT
    nombre,
    categoria,
    victorias,
    derrotas
FROM peleadores
ORDER BY victorias DESC
LIMIT 5;

-- 7. Obtener estadísticas por categoría.
SELECT
    categoria,
    COUNT(*) AS total_peleadores,
    SUM(victorias) AS total_victorias,
    AVG(victorias) AS promedio_victorias
FROM peleadores
GROUP BY categoria
ORDER BY promedio_victorias DESC;