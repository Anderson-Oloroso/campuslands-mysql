CREATE DATABASE IF NOT EXISTS soldadura_industrial_db;
USE soldadura_industrial_db;

CREATE TABLE registros_soldadura (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cordon VARCHAR(20) NOT NULL UNIQUE,
    proceso_soldadura VARCHAR(50) NOT NULL,
    tipo_material VARCHAR(50) NOT NULL,
    amperaje_usado INT NOT NULL,
    calidad_inspeccion_pct DECIMAL(5,2) NOT NULL,
    estado_cordon ENUM('aprobado', 'rechazado', 'revision_pendiente', 'obsoleto') DEFAULT 'revision_pendiente',
    CONSTRAINT chk_amperaje CHECK (amperaje_usado > 0),
    CONSTRAINT chk_calidad_pct CHECK (calidad_inspeccion_pct >= 0.00 AND calidad_inspeccion_pct <= 100.00)
);