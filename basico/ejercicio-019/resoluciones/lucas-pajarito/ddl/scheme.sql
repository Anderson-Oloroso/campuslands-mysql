-- Creación y selección de la Base de Datos
CREATE DATABASE IF NOT EXISTS basico_paracaidismo;
USE basico_paracaidismo;

-- Limpieza previa de tablas en orden inverso a sus dependencias
DROP TABLE IF EXISTS saltos_019;
DROP TABLE IF EXISTS bitacora_saltos_vip_019;
DROP TABLE IF EXISTS paracaidistas_019;
DROP TABLE IF EXISTS instructores_019;

-- Creación de tablas principales

CREATE TABLE instructores_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    licencia_faa VARCHAR(20) NOT NULL UNIQUE,
    saltos_acumulados INT NOT NULL DEFAULT 0 CHECK(saltos_acumulados >= 0)
);

CREATE TABLE paracaidistas_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nivel_experiencia ENUM('Tándem', 'Estudiante', 'Licenciado') NOT NULL DEFAULT 'Tándem',
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE saltos_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    instructor_id INT NOT NULL,
    altitud_pies INT NOT NULL CHECK(altitud_pies >= 3000),
    monto_pago DECIMAL(10, 2) NOT NULL CHECK(monto_pago > 0),
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas_019(id),
    FOREIGN KEY (instructor_id) REFERENCES instructores_019(id)
);

-- Tabla histórica / respaldo para demostrar INSERT INTO ... SELECT
CREATE TABLE bitacora_saltos_vip_019 (
    salto_id INT PRIMARY KEY,
    nombre_paracaidista VARCHAR(80),
    altitud_pies INT,
    monto_pago DECIMAL(10, 2)
);