-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS soldadura_delete_db;
USE soldadura_delete_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS equipos_soldadura;

-- Tabla principal: Registro de Equipos de Soldadura
CREATE TABLE equipos_soldadura (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_equipo VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    tipo_proceso ENUM('SMAW', 'GMAW', 'GTAW', 'FCAW') NOT NULL,
    horas_uso INT NOT NULL CHECK (horas_uso >= 0),
    costo_mantenimiento_usd DECIMAL(10,2) NOT NULL CHECK (costo_mantenimiento_usd >= 0),
    estado ENUM('operativo', 'en_mantenimiento', 'obsoleto', 'descartado') DEFAULT 'operativo',
    fecha_ultimo_mantenimiento DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
