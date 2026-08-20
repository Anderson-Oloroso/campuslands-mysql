-- Campuslands MySQL - Intermedio Ejercicio 055
-- Temática: Laboratorio de Fórmulas Químicas (Uso de restricciones UNIQUE)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS detalle_formulas;
DROP TABLE IF EXISTS reactivos;
DROP TABLE IF EXISTS formulas_quimicas;
DROP TABLE IF EXISTS quimicos_analistas;

-- Tabla de Químicos Analistas / Investigadores
CREATE TABLE quimicos_analistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- Restricción UNIQUE en email
    codigo_colegiado VARCHAR(30) NOT NULL UNIQUE, -- Restricción UNIQUE en credencial profesional
    nivel_acceso ENUM('Junior', 'Senior', 'Director Laboratorio') NOT NULL DEFAULT 'Junior'
);

-- Tabla de Reactivos / Sustancias Base
CREATE TABLE reactivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_reactivo VARCHAR(20) NOT NULL UNIQUE, -- Restricción UNIQUE en código interno
    numero_cas VARCHAR(15) NOT NULL UNIQUE,      -- Restricción UNIQUE en identificador numérico CAS internacional
    nombre_quimico VARCHAR(100) NOT NULL,
    pureza_porcentaje DECIMAL(5,2) NOT NULL CHECK (pureza_porcentaje BETWEEN 0.00 AND 100.00),
    stock_gramos DECIMAL(10,2) NOT NULL CHECK (stock_gramos >= 0.00),
    requiere_refrigeracion BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabla de Fórmulas Químicas / Desarrollos
CREATE TABLE formulas_quimicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(25) NOT NULL UNIQUE, -- Restricción UNIQUE en clave de fórmula
    nombre_formula VARCHAR(100) NOT NULL UNIQUE, -- Restricción UNIQUE para evitar nombres duplicados
    formula_molecular VARCHAR(80) NOT NULL,
    quimico_id INT NOT NULL,
    ph_objetivo DECIMAL(4,2) CHECK (ph_objetivo BETWEEN 0.00 AND 14.00),
    temperatura_reaccion_c DECIMAL(5,2) NOT NULL,
    fecha_creacion DATE NOT NULL,
    estado ENUM('En Desarrollo', 'En Certificación', 'Aprobada', 'Rechazada') NOT NULL DEFAULT 'En Desarrollo',
    FOREIGN KEY (quimico_id) REFERENCES quimicos_analistas(id) ON DELETE CASCADE
);

-- Tabla Intermedia: Composición / Detalle de Fórmulas (Uso de UNIQUE Compuesto)
CREATE TABLE detalle_formulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    formula_id INT NOT NULL,
    reactivo_id INT NOT NULL,
    concentración_proporción DECIMAL(6,3) NOT NULL CHECK (concentración_proporción > 0.000),
    unidad_medida ENUM('g/L', '% w/w', 'mol/L', 'mL/L') NOT NULL DEFAULT 'g/L',
    orden_adicion INT NOT NULL CHECK (orden_adicion > 0),
    FOREIGN KEY (formula_id) REFERENCES formulas_quimicas(id) ON DELETE CASCADE,
    FOREIGN KEY (reactivo_id) REFERENCES reactivos(id) ON DELETE CASCADE,
    -- UNIQUE Compuesto: Un reactivo no puede repetirse dentro de la misma fórmula
    CONSTRAINT uk_formula_reactivo UNIQUE (formula_id, reactivo_id),
    -- UNIQUE Compuesto: No pueden existir dos reactivos con el mismo orden de adición en una misma fórmula
    CONSTRAINT uk_formula_orden UNIQUE (formula_id, orden_adicion)
);