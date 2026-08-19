USE campuslands_mysql;

-- 1. Auditoria de plan de ejecucion (EXPLAIN) con indice UNIQUE:
EXPLAIN SELECT cliente, artista, fecha_sesion 
    FROM avanzado_ejercicio_020_citas 
    WHERE codigo_cita = 'CITA-005';

-- 2. Auditoria (EXPLAIN) con Indice Compuesto B-Tree:
EXPLAIN SELECT cliente, estilo, descripcion 
    FROM avanzado_ejercicio_020_citas 
    WHERE artista = 'Laura Tintas' AND fecha_sesion >= '2026-09-01';

-- 3. Busqueda de texto optimizada (FULLTEXT INDEX vs LIKE):
SELECT codigo_cita, artista, descripcion, 
           MATCH(descripcion) AGAINST('rosas lobo' IN NATURAL LANGUAGE MODE) AS score_relevancia
    FROM avanzado_ejercicio_020_citas
    WHERE MATCH(descripcion) AGAINST('rosas lobo' IN NATURAL LANGUAGE MODE)
    ORDER BY score_relevancia DESC;

-- 4. Busqueda de texto avanzada (BOOLEAN MODE):
SELECT codigo_cita, artista, descripcion
    FROM avanzado_ejercicio_020_citas
    WHERE MATCH(descripcion) AGAINST('+mandalas -craneo' IN BOOLEAN MODE);

-- 5. Recuperacion de datos explotando el indice compuesto (Index Scan):
SELECT cliente, estilo, fecha_sesion 
    FROM avanzado_ejercicio_020_citas 
    WHERE artista = 'Laura Tintas' 
    ORDER BY fecha_sesion ASC;