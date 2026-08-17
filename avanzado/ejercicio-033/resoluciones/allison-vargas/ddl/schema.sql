DROP DATABASE IF EXISTS shooter_skins_db;
CREATE DATABASE shooter_skins_db;
USE shooter_skins_db;

CREATE TABLE skins_shooter (
    id_skin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_skin VARCHAR(60) NOT NULL,
    arma VARCHAR(40) NOT NULL,
    rareza VARCHAR(30) NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL,
    nivel_desgaste DECIMAL(4, 3) NOT NULL,
    estado_inventario VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_base CHECK (precio_base >= 0.00),
    CONSTRAINT chk_desgaste CHECK (nivel_desgaste BETWEEN 0.000 AND 1.000),
    CONSTRAINT chk_rareza CHECK (rareza IN ('Común', 'Rara', 'Épica', 'Legendaria')),
    CONSTRAINT chk_estado_skin CHECK (estado_inventario IN ('Disponible', 'Equipado', 'En Venta'))
);

-- Creación de Función SQL personalizada para calcular el precio final según el desgaste
DELIMITER //
CREATE FUNCTION fn_calcular_precio_real(
    p_precio DECIMAL(10, 2),
    p_desgaste DECIMAL(4, 3)
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precio_final DECIMAL(10, 2);
    -- Entre mayor sea el desgaste (cercano a 1.0), mayor es la devaluación (hasta 50%)
    SET precio_final = p_precio * (1.000 - (p_desgaste * 0.5));
    RETURN precio_final;
END //
DELIMITER ;
