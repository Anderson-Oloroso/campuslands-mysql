USE campuslands_mysql;

-- 1. EXPLAIN de un filtro por marca SIN indice (tabla pequeña, esperar type=ALL)
EXPLAIN SELECT modelo, potencia_hp FROM autos_hiperdeportivos WHERE marca = 'Bugatti';

-- 2. Creacion de indice sobre marca
CREATE INDEX idx_marca_auto ON autos_hiperdeportivos (marca);

-- 3. EXPLAIN de la misma consulta CON indice (comparar type y key contra la consulta 1)
EXPLAIN SELECT modelo, potencia_hp FROM autos_hiperdeportivos WHERE marca = 'Bugatti';

-- 4. EXPLAIN de una consulta con ORDER BY y LIMIT (revisar Extra: Using filesort)
EXPLAIN SELECT modelo, velocidad_max FROM autos_hiperdeportivos ORDER BY velocidad_max DESC LIMIT 5;

-- 5. EXPLAIN de una consulta con condicion en columna no indexada (caso limite: sigue usando type=ALL)
EXPLAIN SELECT modelo, precio FROM autos_hiperdeportivos WHERE estado = 'preventa';