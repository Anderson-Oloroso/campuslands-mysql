-- Campuslands MySQL - avanzado ejercicio-033
-- Tema: inventario de skins shooter (funciones SQL)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS log_auditoria_skins_shooter;
DROP TABLE IF EXISTS skins_inventario;
DROP TABLE IF EXISTS armas_shooter;

CREATE TABLE armas_shooter (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(40) NOT NULL,
    categoria ENUM('Principal','Secundaria','Cuerpo a Cuerpo') NOT NULL,
    estado ENUM('Disponible','Bloqueado') DEFAULT 'Disponible'
);

CREATE TABLE skins_inventario (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    id_arma INT NOT NULL,
    rareza ENUM('Consumer','Restricted','Classified','Covert','Contraband') NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    desgaste ENUM('Recien Fabricado','Casi Nuevo','Algo Desgastado','Bastante Desgastado') NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    FOREIGN KEY (id_arma) REFERENCES armas_shooter(id_arma) ON DELETE CASCADE
);

-- Funcion Almacenada
DROP FUNCTION IF EXISTS fn_calcular_rendimiento_skins_shooter;
DELIMITER //
CREATE FUNCTION fn_calcular_rendimiento_skins_shooter(p_valor DECIMAL(10,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE v_categoria VARCHAR(30);
    IF p_valor >= 1000 THEN
        SET v_categoria = 'Nivel Elite / Legendario';
    ELSEIF p_valor >= 500 THEN
        SET v_categoria = 'Nivel Avanzado / Alto';
    ELSEIF p_valor >= 100 THEN
        SET v_categoria = 'Nivel Estandar / Medio';
    ELSE
        SET v_categoria = 'Nivel Inicial / Base';
    END IF;
    RETURN v_categoria;
END //
DELIMITER ;
