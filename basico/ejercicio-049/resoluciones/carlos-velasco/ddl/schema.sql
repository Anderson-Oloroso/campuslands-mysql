CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
    id_salto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    nivel_experiencia VARCHAR(30) NOT NULL,
    fecha_salto DATE NOT NULL,
    altura_salto_metros INT UNSIGNED NOT NULL,
    duracion_caida_segundos INT UNSIGNED NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
    estado ENUM('programado', 'realizado', 'cancelado') NOT NULL DEFAULT 'programado',

    CONSTRAINT chk_altura_salto
        CHECK (altura_salto_metros > 0),

    CONSTRAINT chk_duracion_caida
        CHECK (duracion_caida_segundos > 0)
);