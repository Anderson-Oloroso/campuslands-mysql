CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS saltos;

CREATE TABLE saltos (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_participante VARCHAR(100) NOT NULL,
    modalidad ENUM('tandem', 'individual', 'curso') NOT NULL,
    altura_salto INT UNSIGNED NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_salto DATE NOT NULL,
    experiencia_nivel ENUM('principiante', 'intermedio', 'avanzado') NOT NULL,
    estado ENUM('programado', 'realizado', 'cancelado') NOT NULL DEFAULT 'programado',

    CONSTRAINT chk_saltos_altura
        CHECK (altura_salto >= 1000),

    CONSTRAINT chk_saltos_precio
        CHECK (precio > 0)
);