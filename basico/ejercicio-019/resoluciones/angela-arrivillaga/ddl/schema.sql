CREATE DATABASE IF NOT EXISTS paracaidismo_db;
USE paracaidismo_db;

CREATE TABLE tipos_salto (
    id_tipo_salto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_modalidad VARCHAR(50) NOT NULL UNIQUE,
    descripcion_modalidad VARCHAR(150),
    altura_salto_pies INT NOT NULL,
    CONSTRAINT chk_altura_pies CHECK (altura_salto_pies > 0)
);

CREATE TABLE saltos_paracaidismo (
    id_salto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_registro VARCHAR(20) NOT NULL UNIQUE,
    nombre_paracaidista VARCHAR(80) NOT NULL,
    id_tipo_salto INT,
    costo_salto DECIMAL(8,2) NOT NULL,
    duracion_caida_libre_seg INT NOT NULL,
    fecha_salto DATE NOT NULL,
    estado_salto ENUM('programado', 'completado', 'cancelado', 'en_espera') DEFAULT 'programado',
    FOREIGN KEY (id_tipo_salto) REFERENCES tipos_salto(id_tipo_salto),
    CONSTRAINT chk_costo_salto CHECK (costo_salto > 0.00),
    CONSTRAINT chk_duracion_caida CHECK (duracion_caida_libre_seg >= 0)
);