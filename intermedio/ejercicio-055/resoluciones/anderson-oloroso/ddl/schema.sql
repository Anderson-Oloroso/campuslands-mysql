USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS formulas_quimicas(
    formula_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_formula VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    nivel_riesgo VARCHAR(100) NOT NULL,
    temperatura_optima DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS reactivos_quimicos(
    reactivo_id INT AUTO_INCREMENT PRIMARY KEY,
    formula_id INT NOT NULL,
    nombre_reactivo VARCHAR(100) NOT NULL,
    concentracion_porcentaje VARCHAR(50) NOT NULL,
    volumen_ml DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_reactivos_quimicos_formulas_quimicas FOREIGN KEY (formula_id) REFERENCES formulas_quimicas(formula_id) ON DELETE CASCADE
);
