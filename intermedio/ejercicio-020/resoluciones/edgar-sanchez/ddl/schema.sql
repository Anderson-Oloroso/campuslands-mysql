-- Campuslands MySQL - intermedio ejercicio 020
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE artistas_tatuajes (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL,
    apodo_artistico VARCHAR(50) NOT NULL UNIQUE,
    estilo_principal VARCHAR(50) NOT NULL,
    anios_experiencia INT NOT NULL CONSTRAINT chk_experiencia CHECK (anios_experiencia >= 0),
    tarifa_por_hora_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_tarifa CHECK (tarifa_por_hora_usd > 0.00)
);

CREATE TABLE clientes_tatuajes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE citas_tatuajes (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    cliente_id INT NOT NULL,
    descripcion_disenio VARCHAR(200) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    fecha_hora_cita DATETIME NOT NULL,
    duracion_estimada_horas DECIMAL(4,2) NOT NULL CONSTRAINT chk_duracion CHECK (duracion_estimada_horas > 0.00),
    monto_total_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_monto_total CHECK (monto_total_usd > 0.00),
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Programada' CONSTRAINT chk_estado_cita CHECK (estado_cita IN ('Programada', 'Completada', 'Cancelada')),
    CONSTRAINT fk_citas_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_tatuajes(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_citas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_tatuajes(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE pagos_citas (
    pago_id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT NOT NULL,
    monto_pago_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_monto_pago CHECK (monto_pago_usd > 0.00),
    metodo_pago VARCHAR(30) NOT NULL CONSTRAINT chk_metodo CHECK (metodo_pago IN ('Efectivo', 'Tarjeta', 'Transferencia')),
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pagos_citas 
        FOREIGN KEY (cita_id) REFERENCES citas_tatuajes(cita_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);