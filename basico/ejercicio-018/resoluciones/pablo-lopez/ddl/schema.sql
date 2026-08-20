-- ============================================================
-- EJERCICIO 018 - PRIMARY KEY PARA VIAJES Y TURISMO
-- Archivo: ddl/schema.sql
-- Motor: MySQL
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ============================================================
-- Tabla principal: destinos
-- ============================================================

CREATE TABLE destinos (
    id_destino INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    continente VARCHAR(50) NOT NULL,
    costo_promedio DECIMAL(10,2) NOT NULL,
    dias_recomendados TINYINT UNSIGNED NOT NULL,
    estado ENUM('disponible', 'no_disponible') NOT NULL DEFAULT 'disponible',

    CONSTRAINT uq_destino_nombre_pais
        UNIQUE (nombre, pais),

    CONSTRAINT chk_destino_costo
        CHECK (costo_promedio > 0),

    CONSTRAINT chk_destino_dias
        CHECK (dias_recomendados > 0)
);