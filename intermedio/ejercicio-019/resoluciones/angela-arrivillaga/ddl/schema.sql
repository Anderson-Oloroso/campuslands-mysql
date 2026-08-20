CREATE DATABASE IF NOT EXISTS paracaidismo_db;
USE paracaidismo_db;

CREATE TABLE saltos_paracaidismo (
    id_salto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_salto VARCHAR(20) NOT NULL UNIQUE,
    nombre_zona VARCHAR(100) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    altura_pies INT NOT NULL,
    duracion_caida_libre_seg INT NOT NULL,
    costo_usd DECIMAL(8,2) NOT NULL,
    estado_salto ENUM('completado', 'programado', 'suspendido') DEFAULT 'completado',
    CONSTRAINT chk_altura CHECK (altura_pies >= 3000),
    CONSTRAINT chk_duracion CHECK (duracion_caida_libre_seg > 0),
    CONSTRAINT chk_costo CHECK (costo_usd > 0.00)
);