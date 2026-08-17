-- DDL: Estructura para catálogo de la saga de ciencia ficción con manejo de fechas
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS entregas_scifi;

CREATE TABLE entregas_scifi (
    entrega_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(80) NOT NULL,
    fecha_estreno DATE NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL CHECK (presupuesto_usd > 0),
    recaudacion_usd DECIMAL(12,2) NOT NULL CHECK (recaudacion_usd >= 0),
    clasificacion ENUM('PG', 'PG-13', 'R') DEFAULT 'PG-13',
    CONSTRAINT chk_fecha_valida CHECK (fecha_estreno >= '1900-01-01')
) ENGINE=InnoDB;
