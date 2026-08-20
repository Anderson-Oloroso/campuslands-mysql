CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS dibujos;

CREATE TABLE dibujos (
    id_dibujo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    programa VARCHAR(50) NOT NULL,
    resolucion VARCHAR(30) NOT NULL,
    horas_trabajo DECIMAL(5,2) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('borrador', 'en_proceso', 'finalizado') NOT NULL DEFAULT 'borrador',
    fecha_creacion DATE NOT NULL,

    CONSTRAINT chk_horas_positivas CHECK (horas_trabajo > 0),
    CONSTRAINT chk_precio_no_negativo CHECK (precio >= 0)
);