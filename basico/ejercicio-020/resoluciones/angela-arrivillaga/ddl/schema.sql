CREATE DATABASE IF NOT EXISTS estudio_tatuajes_db;
USE estudio_tatuajes_db;

CREATE TABLE estilos_tatuaje (
    id_estilo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estilo VARCHAR(50) NOT NULL UNIQUE,
    descripcion_estilo VARCHAR(150)
);

CREATE TABLE citas_tatuajes (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cita VARCHAR(20) NOT NULL UNIQUE,
    nombre_cliente VARCHAR(80) NOT NULL,
    nombre_artista VARCHAR(80) NOT NULL,
    id_estilo INT,
    costo_estimado DECIMAL(8,2) NOT NULL,
    duracion_horas INT NOT NULL,
    fecha_cita DATE NOT NULL,
    estado_cita ENUM('programada', 'completada', 'en_proceso', 'cancelada') DEFAULT 'programada',
    FOREIGN KEY (id_estilo) REFERENCES estilos_tatuaje(id_estilo),
    CONSTRAINT chk_costo_cita CHECK (costo_estimado > 0.00),
    CONSTRAINT chk_duracion_horas CHECK (duracion_horas > 0)
);