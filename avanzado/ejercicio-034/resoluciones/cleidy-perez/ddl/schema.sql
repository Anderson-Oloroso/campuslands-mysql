-- Campuslands MySQL - basico ejercicio 004
-- Ejecuta este archivo antes de inserts.sql.

USE campuslands_mysql;

-- 1. Eliminar objetos si ya existen
DROP TRIGGER IF EXISTS registrar_historial_ingreso;
DROP TABLE IF EXISTS historial_ingresos;
DROP TABLE IF EXISTS garage_motos;

-- 2. Crear la tabla principal
CREATE TABLE garage_motos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada_cc INT NOT NULL,
    servicio_requerido VARCHAR(150) NOT NULL,
    costo_estimado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('en_espera', 'en_reparacion', 'listo', 'entregado') NOT NULL DEFAULT 'en_espera',
    fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3. Crear la tabla de respaldo / historial
CREATE TABLE historial_ingresos (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    servicio VARCHAR(150),
    costo DECIMAL(10,2),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. Crear el TRIGGER
DELIMITER //

CREATE TRIGGER registrar_historial_ingreso
AFTER INSERT ON garage_motos
FOR EACH ROW
BEGIN
    INSERT INTO historial_ingresos (placa, servicio, costo)
    VALUES (NEW.placa, NEW.servicio_requerido, NEW.costo_estimado);
END //

DELIMITER ;
GRANT TRIGGER ON campuslands_mysql.* TO 'campus'@'%';
FLUSH PRIVILEGES;