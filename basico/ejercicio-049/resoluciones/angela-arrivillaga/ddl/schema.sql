CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE saltos_paracaidismo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista VARCHAR(100) NOT NULL,
    altura_pies INT NOT NULL,
    duracion_caida_segundos INT NOT NULL,
    calificacion_aterrizaje DECIMAL(3, 1) NOT NULL,
    estado ENUM('completado', 'pendiente', 'cancelado') DEFAULT 'completado',
    CONSTRAINT chk_altura CHECK (altura_pies > 0),
    CONSTRAINT chk_duracion CHECK (duracion_caida_segundos > 0),
    CONSTRAINT chk_calificacion_paracaidismo CHECK (calificacion_aterrizaje BETWEEN 0 AND 10)
);