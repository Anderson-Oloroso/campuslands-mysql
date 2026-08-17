-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS soldadura_fk_db;
USE soldadura_fk_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS inspecciones_calidad;
DROP TABLE IF EXISTS inspectores;

-- Tabla Padre: Inspectores Certificados (Entidad Principal)
CREATE TABLE inspectores (
    id_inspector INT AUTO_INCREMENT PRIMARY KEY,
    nombre_inspector VARCHAR(100) NOT NULL,
    certificacion_nivel VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla Hija: Inspecciones de Calidad en Soldadura (Uso de FOREIGN KEY)
CREATE TABLE inspecciones_calidad (
    id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
    id_inspector INT NOT NULL,
    codigo_junta VARCHAR(30) NOT NULL,
    tipo_ensayo ENUM('VT_Visual', 'UT_Ultrasonido', 'RT_Radiografia', 'PT_Tintes') NOT NULL,
    resultado ENUM('aprobado', 'rechazado', 'requiere_reparacion') NOT NULL,
    costo_ensayo_usd DECIMAL(10,2) NOT NULL CHECK (costo_ensayo_usd >= 0),
    fecha_inspeccion DATE NOT NULL,
    FOREIGN KEY (id_inspector) REFERENCES inspectores(id_inspector) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
