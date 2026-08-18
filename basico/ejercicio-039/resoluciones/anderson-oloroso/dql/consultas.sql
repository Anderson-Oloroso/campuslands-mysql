USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por victorias_ko descendentemente
SELECT peleador_id, nombre_peleador, categoria_peso, gimnasio, victorias_ko, estado
FROM peleadores_kickboxing
ORDER BY victorias_ko DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT peleador_id, nombre_peleador, categoria_peso, victorias_ko
FROM peleadores_kickboxing
WHERE estado = 'Activo';

-- 3. Agrupar por categoria_peso y calcular total y promedio de victorias_ko
SELECT categoria_peso, COUNT(*) AS total_registros, AVG(victorias_ko) AS promedio_valor
FROM peleadores_kickboxing
GROUP BY categoria_peso
ORDER BY promedio_valor DESC;

-- 4. Filtrar por victorias_ko mayor a 2000
SELECT peleador_id, nombre_peleador, categoria_peso, victorias_ko
FROM peleadores_kickboxing
WHERE victorias_ko > 2000.00
ORDER BY victorias_ko ASC;

-- 5. Seleccionar los 5 mejores registros según victorias_ko
SELECT peleador_id, nombre_peleador, categoria_peso, victorias_ko
FROM peleadores_kickboxing
ORDER BY victorias_ko DESC
LIMIT 5;
