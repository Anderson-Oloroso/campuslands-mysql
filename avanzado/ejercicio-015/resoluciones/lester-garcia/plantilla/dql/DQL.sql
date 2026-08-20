USE ejercicio_15_adv;

-- ==========================================
-- 1. Consulta sin índice para analizar
-- ==========================================

EXPLAIN
SELECT *
FROM games
WHERE genre = 'Action';


-- ==========================================
-- 2. Consulta utilizando un índice
-- ==========================================

EXPLAIN
SELECT *
FROM games
WHERE genre = 'Action'
AND platform = 'PC';


-- ==========================================
-- 3. Consulta sobre préstamos
-- ==========================================

EXPLAIN
SELECT *
FROM loans
WHERE game_id = 3;


-- ==========================================
-- 4. Consulta utilizando fecha
-- ==========================================

EXPLAIN
SELECT *
FROM loans
WHERE loan_date >= '2026-02-01';


-- ==========================================
-- 5. Consulta con JOIN
-- ==========================================

EXPLAIN
SELECT
    u.username,
    g.game_title,
    l.loan_date
FROM loans l
INNER JOIN users u
ON l.user_id = u.user_id
INNER JOIN games g
ON l.game_id = g.game_id
WHERE g.genre = 'Action';


-- ==========================================
-- 6. Verificar índices de las tablas
-- ==========================================

SHOW INDEX FROM games;

SHOW INDEX FROM loans;


-- ==========================================
-- 7. Consultas para comprobar los resultados
-- ==========================================

SELECT *
FROM games
WHERE genre = 'Action';

SELECT *
FROM loans
WHERE game_id = 3;