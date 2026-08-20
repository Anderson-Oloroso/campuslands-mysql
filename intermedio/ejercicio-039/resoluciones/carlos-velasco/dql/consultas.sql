USE campuslands_mysql;

-- 1. Mostrar cada peleador junto con su entrenador.
SELECT
    p.nombre AS peleador,
    p.categoria_peso AS categoria,
    e.nombre AS entrenador
FROM peleadores AS p
INNER JOIN entrenadores AS e
    ON p.id_entrenador = e.id_entrenador
ORDER BY p.nombre ASC;


-- 2. Mostrar peleadores con entrenadores activos.
SELECT
    p.nombre AS peleador,
    e.nombre AS entrenador,
    e.estado
FROM peleadores AS p
INNER JOIN entrenadores AS e
    ON p.id_entrenador = e.id_entrenador
WHERE e.estado = 'activo'
ORDER BY p.nombre ASC;


-- 3. Contar peleadores por entrenador.
SELECT
    e.nombre AS entrenador,
    COUNT(p.id_peleador) AS total_peleadores
FROM entrenadores AS e
LEFT JOIN peleadores AS p
    ON e.id_entrenador = p.id_entrenador
GROUP BY e.id_entrenador, e.nombre
ORDER BY total_peleadores DESC;


-- 4. Mostrar los peleadores con más de 10 victorias.
SELECT
    p.nombre AS peleador,
    p.victorias,
    e.nombre AS entrenador
FROM peleadores AS p
INNER JOIN entrenadores AS e
    ON p.id_entrenador = e.id_entrenador
WHERE p.victorias > 10
ORDER BY p.victorias DESC;


-- 5. Ranking de peleadores por victorias.
SELECT
    p.nombre AS peleador,
    p.categoria_peso AS categoria,
    p.victorias,
    p.derrotas,
    (p.victorias - p.derrotas) AS balance
FROM peleadores AS p
ORDER BY p.victorias DESC, p.derrotas ASC;


-- 6. Peleadores de peso welter.
SELECT
    p.nombre AS peleador,
    p.edad,
    p.categoria_peso AS categoria,
    e.nombre AS entrenador
FROM peleadores AS p
INNER JOIN entrenadores AS e
    ON p.id_entrenador = e.id_entrenador
WHERE p.categoria_peso = 'Peso welter'
ORDER BY p.victorias DESC;


-- 7. Entrenadores que tienen al menos dos peleadores.
SELECT
    e.nombre AS entrenador,
    COUNT(p.id_peleador) AS total_peleadores
FROM entrenadores AS e
INNER JOIN peleadores AS p
    ON e.id_entrenador = p.id_entrenador
GROUP BY e.id_entrenador, e.nombre
HAVING COUNT(p.id_peleador) >= 2
ORDER BY total_peleadores DESC;