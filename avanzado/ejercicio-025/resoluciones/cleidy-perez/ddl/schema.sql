-- Campuslands MySQL - avanzado ejercicio 025
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS lab_formulas_quimicas;
USE lab_formulas_quimicas;

-- 1. Tabla Reactivos Básicos (Uso de UNIQUE en código CAS e IUPAC)
CREATE TABLE IF NOT EXISTS reactivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cas_number VARCHAR(20) NOT NULL UNIQUE,
    nombre_quimico VARCHAR(100) NOT NULL UNIQUE,
    formula_molecular VARCHAR(50) NOT NULL,
    nivel_riesgo ENUM('Bajo', 'Medio', 'Alto', 'Critico') DEFAULT 'Bajo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabla Químicos / Investigadores
CREATE TABLE IF NOT EXISTS investigadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_credencial VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla Fórmulas Químicas
CREATE TABLE IF NOT EXISTS formulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(20) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(100) NOT NULL UNIQUE,
    id_investigador INT NOT NULL,
    fecha_creacion DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_formulas_investigadores 
        FOREIGN KEY (id_investigador) REFERENCES investigadores(id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla Ejercicios Prácticos
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    tematica VARCHAR(100) NOT NULL,
    id_formula INT NOT NULL UNIQUE, -- Relación 1:1 estricta mediante UNIQUE
    CONSTRAINT fk_ejercicios_formulas 
        FOREIGN KEY (id_formula) REFERENCES formulas(id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla Detalle de Composición de Fórmulas (UNIQUE Compuesto)
CREATE TABLE IF NOT EXISTS composicion_formulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_formula INT NOT NULL,
    id_reactivo INT NOT NULL,
    concentracion_porcentaje DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_comp_formula FOREIGN KEY (id_formula) REFERENCES formulas(id) ON DELETE CASCADE,
    CONSTRAINT fk_comp_reactivo FOREIGN KEY (id_reactivo) REFERENCES reactivos(id) ON DELETE RESTRICT,
    CONSTRAINT uq_formula_reactivo UNIQUE (id_formula, id_reactivo) -- Evita reactivos repetidos en una misma fórmula
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
