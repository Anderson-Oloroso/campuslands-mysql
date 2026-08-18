-- 1. Ver índices creados
SHOW INDEX FROM `ejercicio-021-adv-dibujos`;

-- 2. EXPLAIN consulta con índice (artista)
EXPLAIN SELECT * FROM `ejercicio-021-adv-dibujos` WHERE artista = 'Carlos';

-- 3. EXPLAIN consulta con índice (precio)
EXPLAIN SELECT * FROM `ejercicio-021-adv-dibujos` WHERE precio BETWEEN 100 AND 200;