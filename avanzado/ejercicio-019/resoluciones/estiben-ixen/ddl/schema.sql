-- Campuslands MySQL - avanzado ejercicio-019
-- Tema: paracaidismo (triggers)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_paracaidismo;
DROP TABLE IF EXISTS saltos_registrados;
DROP TABLE IF EXISTS zonas_salto;

CREATE TABLE zonas_salto (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(60) NOT NULL UNIQUE,
    altitud_pista_metros INT NOT NULL,
    pais VARCHAR(40) NOT NULL
);

CREATE TABLE saltos_registrados (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista VARCHAR(70) NOT NULL,
    tipo_salto ENUM('Tandem','Solo AFF','Wingsuit','Formacion BFR','HALO') NOT NULL,
    id_zona INT NOT NULL,
    altitud_salto_pies INT NOT NULL,
    tiempo_caida_libre_seg INT NOT NULL,
    costo_salto DECIMAL(7,2) NOT NULL,
    fecha_salto DATETIME NOT NULL,
    FOREIGN KEY (id_zona) REFERENCES zonas_salto(id_zona) ON DELETE CASCADE
);

-- Tabla de Auditoria para Triggers
CREATE TABLE log_auditoria_paracaidismo (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50) NOT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    registro_id INT NOT NULL,
    detalles TEXT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger AFTER INSERT
DROP TRIGGER IF EXISTS trg_despues_insertar_paracaidismo;
DELIMITER //
CREATE TRIGGER trg_despues_insertar_paracaidismo
AFTER INSERT ON saltos_registrados
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria_paracaidismo (accion, tabla_afectada, registro_id, detalles)
    VALUES ('INSERT', 'saltos_registrados', NEW.id_salto, CONCAT('Se creo el registro: ', NEW.paracaidista));
END //
DELIMITER ;
