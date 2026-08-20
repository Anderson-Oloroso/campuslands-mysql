USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE REFERENCIA DE BACKUP LÓGICO (CLI)
-- ==========================================
/*
  Para realizar un backup lógico (dump) de esta tabla o base de datos desde la terminal del sistema, 
  se utiliza la herramienta mysqldump:

  1. Respaldar toda la base de datos 'campuslands_mysql':
     mysqldump -u root -p campuslands_mysql > backup_campuslands.sql

  2. Respaldar únicamente la tabla de fórmulas químicas:
     mysqldump -u root -p campuslands_mysql formulas_quimicas_avanzado > backup_formulas.sql

  3. Restaurar el respaldo desde la terminal:
     mysql -u root -p campuslands_mysql < backup_campuslands.sql
*/


-- ==========================================
-- SECCIÓN DE CONSULTAS ANALÍTICAS (Mínimo 5 requeridas)
-- ==========================================

-- 1. Resumen por tipo de compuesto mostrando conteo de fórmulas y volumen total acumulado
SELECT tipo_compuesto, COUNT(*) AS total_formulas, SUM(volumen_ml) AS volumen_total_ml
FROM formulas_quimicas_avanzado
GROUP BY tipo_compuesto
ORDER BY volumen_total_ml DESC;

-- 2. Conteo y volumen de fórmulas activas agrupadas por tipo de compuesto
SELECT tipo_compuesto, COUNT(*) AS formulas_activas, SUM(volumen_ml) AS volumen_activo_ml
FROM formulas_quimicas_avanzado
WHERE estado = 'activo'
GROUP BY tipo_compuesto
ORDER BY formulas_activas DESC;

-- 3. Fórmulas en estado de revisión o archivadas ordenadas por fecha de creación
SELECT nombre_formula, codigo_referencia, tipo_compuesto, estado, creado_en 
FROM formulas_quimicas_avanzado 
WHERE estado IN ('revision', 'archivado')
ORDER BY creado_en ASC;

-- 4. Top 3 fórmulas químicas con mayor volumen registrado sin importar su estado
SELECT nombre_formula, codigo_referencia, tipo_compuesto, volumen_ml 
FROM formulas_quimicas_avanzado 
ORDER BY volumen_ml DESC 
LIMIT 3;

-- 5. Listado general de fórmulas ordenadas alfabéticamente por nombre
SELECT nombre_formula, codigo_referencia, tipo_compuesto, volumen_ml, estado 
FROM formulas_quimicas_avanzado 
ORDER BY nombre_formula ASC;