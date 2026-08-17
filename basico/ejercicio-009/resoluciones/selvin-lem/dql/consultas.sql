USE campuslands_mysql;

-- 1. Listado general tras los DELETE (confirmar que ya no estan los eliminados)
SELECT * FROM kickboxing_peleadores;

-- 2. Confirmar que Pablo Ixchel ya no existe (debe devolver 0 filas)
SELECT * FROM kickboxing_peleadores WHERE nombre_peleador = 'Pablo Ixchel';

-- 3. Confirmar que no quedan descalificados (debe devolver 0 filas)
SELECT * FROM kickboxing_peleadores WHERE estado = 'descalificado';

-- 4. Peleadores activos restantes, ordenados por victorias
SELECT nombre_peleador, categoria_peso, victorias
FROM kickboxing_peleadores
WHERE estado = 'activo'
ORDER BY victorias DESC;

-- 5. Cantidad total de registros restantes (verificar que se borraron exactamente 2)
SELECT COUNT(*) AS total_peleadores FROM kickboxing_peleadores;