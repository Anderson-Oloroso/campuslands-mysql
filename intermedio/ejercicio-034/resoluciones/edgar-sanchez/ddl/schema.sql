-- Campuslands MySQL - intermedio ejercicio 034
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE marcas_moto (
    marca_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    sitio_web VARCHAR(100) NOT NULL
);

CREATE TABLE clientes_garaje (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE modelos_moto (
    modelo_id INT AUTO_INCREMENT PRIMARY KEY,
    marca_id INT NOT NULL,
    nombre_modelo VARCHAR(100) NOT NULL,
    cilindrada_cc INT NOT NULL CONSTRAINT chk_cilindrada CHECK (cilindrada_cc > 0),
    tipo_moto VARCHAR(30) NOT NULL CONSTRAINT chk_tipo_moto CHECK (tipo_moto IN ('Deportiva', 'Naked', 'Custom', 'Enduro', 'Scooter', 'Touring')),
    CONSTRAINT fk_modelos_marcas 
        FOREIGN KEY (marca_id) REFERENCES marcas_moto(marca_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_marca_modelo 
        UNIQUE (marca_id, nombre_modelo)
);

CREATE TABLE motocicletas_cliente (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    modelo_id INT NOT NULL,
    placa VARCHAR(15) NOT NULL UNIQUE,
    anio_fabricacion INT NOT NULL CONSTRAINT chk_anio CHECK (anio_fabricacion BETWEEN 1990 AND 2026),
    color VARCHAR(30) NOT NULL,
    CONSTRAINT fk_motos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_garaje(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_motos_modelos 
        FOREIGN KEY (modelo_id) REFERENCES modelos_moto(modelo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE servicios_mantenimiento (
    servicio_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    fecha_servicio DATE NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    costo_mano_obra_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_mano_obra CHECK (costo_mano_obra_usd >= 0.00),
    costo_repuestos_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_repuestos CHECK (costo_repuestos_usd >= 0.00),
    estado_servicio VARCHAR(20) NOT NULL DEFAULT 'Completado' CONSTRAINT chk_estado_serv CHECK (estado_servicio IN ('En Proceso', 'Completado', 'Cancelado')),
    CONSTRAINT fk_servicios_motos 
        FOREIGN KEY (moto_id) REFERENCES motocicletas_cliente(moto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);