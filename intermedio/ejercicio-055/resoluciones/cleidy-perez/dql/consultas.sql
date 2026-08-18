-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    e.codigo AS codigo_ejercicio,
    e.titulo,
    e.dificultad,
    f.codigo_formula,
    f.nombre_comercial AS formula,
    i.nombre AS investigador_responsable
FROM ejercicios e
INNER JOIN formulas f ON e.id_formula = f.id
INNER JOIN investigadores i ON f.id_investigador = i.id
WHERE e.codigo = 'EJ-025';

-- Esta consulta dará ERROR en MySQL porque el cas_number '7647-01-0' ya pertenece al Ácido Clorhídrico:
INSERT INTO reactivos (cas_number, nombre_quimico, formula_molecular) 
VALUES ('7647-01-0', 'Ácido Muriático Duplicado', 'HCl');