-- Creación y selección de la Base de Datos
CREATE DATABASE IF NOT EXISTS avanzado_paracaidismo;
USE avanzado_paracaidismo;

-- Limpieza previa de tablas
DROP TABLE IF EXISTS auditoria_saltos_019;
DROP TABLE IF EXISTS saltos_019;
DROP TABLE IF EXISTS paracaidistas_019;
DROP TABLE IF EXISTS instructores_019;

-- Creación de tablas principales

CREATE TABLE instructores_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    licencia_faa VARCHAR(20) NOT NULL UNIQUE,
    saltos_acumulados INT NOT NULL DEFAULT 0 CHECK(saltos_acumulados >= 0)
) ENGINE=InnoDB;

CREATE TABLE paracaidistas_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    total_saltos INT NOT NULL DEFAULT 0 CHECK(total_saltos >= 0),
    nivel_experiencia ENUM('Tándem', 'Estudiante', 'Licenciado A', 'Licenciado B', 'Master') NOT NULL DEFAULT 'Tándem'
) ENGINE=InnoDB;

CREATE TABLE saltos_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    instructor_id INT NOT NULL,
    altitud_pies INT NOT NULL CHECK(altitud_pies >= 3000),
    monto_pago DECIMAL(10, 2) NOT NULL CHECK(monto_pago > 0),
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas_019(id),
    FOREIGN KEY (instructor_id) REFERENCES instructores_019(id)
) ENGINE=InnoDB;

-- Tabla de auditoría para registrar eventos disparados
CREATE TABLE auditoria_saltos_019 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    detalle VARCHAR(255) NOT NULL,
    usuario VARCHAR(80) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;