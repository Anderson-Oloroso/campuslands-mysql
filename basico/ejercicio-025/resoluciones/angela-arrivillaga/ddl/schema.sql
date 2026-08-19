CREATE DATABASE IF NOT EXISTS formulas_quimicas_db;
USE formulas_quimicas_db;

CREATE TABLE formulas_quimicas (
    id_formula INT PRIMARY KEY AUTO_INCREMENT,
    codigo_formula VARCHAR(20) NOT NULL UNIQUE,
    nombre_compuesto VARCHAR(100) NOT NULL,
    categoria_quimica VARCHAR(50) NOT NULL,
    cantidad_mililitros DECIMAL(8,2) NOT NULL,
    costo_produccion_usd DECIMAL(10,2) NOT NULL,
    nivel_toxicidad ENUM('bajo', 'moderado', 'alto', 'critico') DEFAULT 'bajo',
    CONSTRAINT chk_cantidad_ml CHECK (cantidad_mililitros > 0.00),
    CONSTRAINT chk_costo_usd CHECK (costo_produccion_usd > 0.00)
);