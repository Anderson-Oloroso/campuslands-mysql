-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    quimico_a_cargo,
    COUNT(id_ensayo) AS total_ensayos,
    SUM(volumen_ml) AS volumen_total_preparado_ml,
    SUM(costo_reactivo) AS presupuesto_total_gastado
FROM ensayo_formulas_quimicas
GROUP BY quimico_a_cargo;
