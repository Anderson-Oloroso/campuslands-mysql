-- Campuslands MySQL - Avanzado Ejercicio 055
-- Backup Lógico para Laboratorio de Fórmulas Químicas

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva de tablas
DROP TABLE IF EXISTS analisis_reactivos;
DROP TABLE IF EXISTS componentes_formula;
DROP TABLE IF EXISTS formulas_quimicas;
DROP TABLE IF EXISTS reactivos;

-- 1. Tabla: Reactivos / Materia Prima
CREATE TABLE reactivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_quimico VARCHAR(100) NOT NULL,
    formula_molecular VARCHAR(50) NOT NULL,
    numero_cas VARCHAR(20) UNIQUE NOT NULL,
    nivel_pureza_pct DECIMAL(5,2) NOT NULL,
    stock_gramos DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    nivel_riesgo ENUM('Bajo', 'Moderado', 'Alto', 'Crítico') NOT NULL DEFAULT 'Bajo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_pureza CHECK (nivel_pureza_pct BETWEEN 0.00 AND 100.00),
    CONSTRAINT chk_stock CHECK (stock_gramos >= 0.00)
) ENGINE=InnoDB;

-- 2. Tabla: Fórmulas Químicas
CREATE TABLE formulas_quimicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(30) UNIQUE NOT NULL,
    nombre_producto VARCHAR(120) NOT NULL,
    aplicacion ENUM('Farmacéutica', 'Cosmética', 'Industrial', 'Alimentaria') NOT NULL,
    ph_objetivo DECIMAL(4,2) NOT NULL,
    temperatura_mezcla_c DECIMAL(5,2) NOT NULL DEFAULT 25.00,
    estado ENUM('Borrador', 'En Pruebas', 'Aprobado', 'Obsoleto') NOT NULL DEFAULT 'Borrador',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_ph CHECK (ph_objetivo BETWEEN 0.00 AND 14.00)
) ENGINE=InnoDB;

-- 3. Tabla Intermedia: Componentes de la Fórmula
CREATE TABLE componentes_formula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    formula_id INT NOT NULL,
    reactivo_id INT NOT NULL,
    concentracion_pct DECIMAL(5,2) NOT NULL,
    orden_adicion INT NOT NULL DEFAULT 1,
    FOREIGN KEY (formula_id) REFERENCES formulas_quimicas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (reactivo_id) REFERENCES reactivos(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_concentracion CHECK (concentracion_pct > 0.00 AND concentracion_pct <= 100.00)
) ENGINE=InnoDB;

-- 4. Tabla: Análisis de Calidad / Pruebas de Reactivos
CREATE TABLE analisis_reactivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reactivo_id INT NOT NULL,
    lote_codigo VARCHAR(40) NOT NULL,
    ph_medido DECIMAL(4,2) NOT NULL,
    impurezas_ppm DECIMAL(7,2) NOT NULL DEFAULT 0.00,
    resultado ENUM('Conforme', 'No Conforme', 'En Observación') NOT NULL DEFAULT 'Conforme',
    fecha_analisis DATE NOT NULL,
    FOREIGN KEY (reactivo_id) REFERENCES reactivos(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_ph_medido CHECK (ph_medido BETWEEN 0.00 AND 14.00)
) ENGINE=InnoDB;