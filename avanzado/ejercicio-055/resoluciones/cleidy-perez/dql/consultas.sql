-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    TABLE_NAME AS tabla,
    CONSTRAINT_NAME AS nombre_restriccion,
    COLUMN_NAME AS columna_unica
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'lab_formulas_quimicas' 
  AND CONSTRAINT_NAME != 'PRIMARY' 
  AND REFERENCED_TABLE_NAME IS NULL;
