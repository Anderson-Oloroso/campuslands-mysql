-- Campuslands MySQL - intermedio ejercicio 019
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE centros_salto (
    centro_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_centro VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    altitud_base_pies INT NOT NULL CONSTRAINT chk_altitud CHECK (altitud_base_pies >= 0)
);

CREATE TABLE instructores_paracaidismo (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_instructor VARCHAR(100) NOT NULL,
    licencia_numero VARCHAR(30) NOT NULL UNIQUE,
    nivel_certificacion VARCHAR(30) NOT NULL CONSTRAINT chk_certificacion CHECK (nivel_certificacion IN ('A', 'B', 'C', 'D', 'Tandem Master', 'AFF Instructor')),
    total_saltos_historicos INT NOT NULL CONSTRAINT chk_saltos_historicos CHECK (total_saltos_historicos >= 0)
);

CREATE TABLE clientes_paracaidismo (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE saltos_paracaidismo (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    centro_id INT NOT NULL,
    cliente_id INT NOT NULL,
    instructor_id INT NOT NULL,
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modalidad VARCHAR(30) NOT NULL CONSTRAINT chk_modalidad CHECK (modalidad IN ('Tándem', 'AFF', 'Salto Solo', 'Wingsuit')),
    altura_salto_pies INT NOT NULL CONSTRAINT chk_altura_salto CHECK (altura_salto_pies >= 3000),
    tiempo_caida_libre_segundos INT NOT NULL CONSTRAINT chk_tiempo_caida CHECK (tiempo_caida_libre_segundos >= 0),
    precio_salto_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_salto CHECK (precio_salto_usd > 0.00),
    CONSTRAINT fk_saltos_centros 
        FOREIGN KEY (centro_id) REFERENCES centros_salto(centro_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_paracaidismo(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_instructores 
        FOREIGN KEY (instructor_id) REFERENCES instructores_paracaidismo(instructor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);