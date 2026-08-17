-- DDL: Estructura de saltos de paracaidismo enfocada en agregaciones con HAVING
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_having;

CREATE TABLE saltos_having (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_salto VARCHAR(15) NOT NULL UNIQUE,
    instructor_nombre VARCHAR(100) NOT NULL,
    modalidad ENUM('tandem', 'solo', 'freefly', 'formación', 'wing suit') NOT NULL,
    zona_salto VARCHAR(100) NOT NULL,
    altura_pies INT NOT NULL CHECK (altura_pies >= 3000),
    monto_usd DECIMAL(8,2) NOT NULL CHECK (monto_usd > 0.00),
    estado ENUM('realizado', 'cancelado', 'pendiente') NOT NULL DEFAULT 'realizado',
    fecha_salto DATE NOT NULL
) ENGINE=InnoDB;
