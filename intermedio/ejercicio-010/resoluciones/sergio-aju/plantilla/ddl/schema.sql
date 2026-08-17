CREATE DATABASE IF NOT EXISTS carreras_urbanas;
USE carreras_urbanas;

CREATE TABLE pilotos (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    alias VARCHAR(50) UNIQUE NOT NULL, -- Aquí aplico UNIQUE, no pueden haber dos alias iguales
    vehiculo VARCHAR(50) NOT NULL,
    categoria VARCHAR(20) DEFAULT 'Novato',
    victorias INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'activo'
);