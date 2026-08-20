CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE zonas_salto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    altitud_msnm INT NOT NULL,
    CONSTRAINT chk_altitud CHECK (altitud_msnm > 0)
);

CREATE TABLE saltos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    zona_id INT NOT NULL,
    nombre_paracaidista VARCHAR(80) NOT NULL,
    altura_salto_pies INT NOT NULL,
    tiempo_caida_libre_seg INT NOT NULL,
    estado_salto ENUM('completado', 'cancelado', 'pendiente') DEFAULT 'completado',
    CONSTRAINT fk_zona FOREIGN KEY (zona_id) REFERENCES zonas_salto(id) ON DELETE CASCADE,
    CONSTRAINT chk_altura CHECK (altura_salto_pies >= 1000),
    CONSTRAINT chk_tiempo CHECK (tiempo_caida_libre_seg > 0)
);