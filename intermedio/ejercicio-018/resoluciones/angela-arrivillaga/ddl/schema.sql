CREATE DATABASE IF NOT EXISTS viajes_turismo_db;
USE viajes_turismo_db;

CREATE TABLE destinos_turisticos (
    id_destino INT PRIMARY KEY AUTO_INCREMENT,
    codigo_destino VARCHAR(20) NOT NULL UNIQUE,
    nombre_destino VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    continente VARCHAR(50) NOT NULL,
    categoria_turistica ENUM('Aventura', 'Playa y Sol', 'Cultural', 'Ecoturismo', 'Urbano') NOT NULL,
    costo_promedio_diario DECIMAL(8,2) NOT NULL,
    calificacion_promedio DECIMAL(3,2) NOT NULL,
    estado_destino ENUM('activo', 'proximamente', 'suspendido') DEFAULT 'activo',
    CONSTRAINT chk_costo_diario CHECK (costo_promedio_diario > 0.00),
    CONSTRAINT chk_calificacion CHECK (calificacion_promedio >= 0.00 AND calificacion_promedio <= 5.00)
);