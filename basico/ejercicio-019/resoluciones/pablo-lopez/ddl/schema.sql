-- ============================================================
-- EJERCICIO 019 - INSERT PARA PARACAIDISMO
-- Archivo: ddl/schema.sql
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ============================================================
-- Tabla principal: saltos
-- ============================================================

CREATE TABLE saltos (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_salto INT UNSIGNED NOT NULL,
    duracion_caida DECIMAL(5,2) NOT NULL,
    fecha_salto DATE NOT NULL,
    estado ENUM('completado', 'programado', 'cancelado') NOT NULL DEFAULT 'programado',

    CONSTRAINT chk_altura_salto
        CHECK (altura_salto > 0),

    CONSTRAINT chk_duracion_caida
        CHECK (duracion_caida > 0)
);