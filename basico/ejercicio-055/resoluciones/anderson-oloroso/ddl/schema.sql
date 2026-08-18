USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS formulas_quimicas(
    formula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_formula VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel_riesgo VARCHAR(100) NOT NULL,
    temperatura_optima DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
