-- Campuslands MySQL - avanzado ejercicio 018
-- Contexto: Modulo de datos para viajes y turismo (Funciones SQL - UDF).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP FUNCTION IF EXISTS fn_avanz_018_calcular_precio_temporada;
DROP FUNCTION IF EXISTS fn_avanz_018_categorizar_vuelo;
DROP TABLE IF EXISTS avanzado_ejercicio_018_vuelos;

CREATE TABLE avanzado_ejercicio_018_vuelos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_vuelo VARCHAR(10) NOT NULL UNIQUE,
  origen VARCHAR(100) NOT NULL,
  destino VARCHAR(100) NOT NULL,
  distancia_km INT NOT NULL,
  precio_base DECIMAL(8,2) NOT NULL,
  fecha_salida DATE NOT NULL
);

-- Funcion 1: Calcular precio final segun la temporada
DELIMITER //
CREATE FUNCTION fn_avanz_018_calcular_precio_temporada(
    p_precio_base DECIMAL(8,2),
    p_fecha_vuelo DATE
)
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE v_mes INT;
    DECLARE v_precio_final DECIMAL(8,2);

    SET v_mes = MONTH(p_fecha_vuelo);

    -- Temporada Alta: Julio (7), Agosto (8), Diciembre (12)
    IF v_mes IN (7, 8, 12) THEN
        SET v_precio_final = p_precio_base * 1.20; -- 20% de recargo
    ELSE
        SET v_precio_final = p_precio_base; -- Precio normal
    END IF;

    RETURN v_precio_final;
END //
DELIMITER ;

-- Funcion 2: Categorizar el vuelo en funcion de su distancia
DELIMITER //
CREATE FUNCTION fn_avanz_018_categorizar_vuelo(
    p_distancia_km INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_categoria VARCHAR(50);

    IF p_distancia_km < 1500 THEN
        SET v_categoria = 'Corto Alcance';
    ELSEIF p_distancia_km BETWEEN 1500 AND 4000 THEN
        SET v_categoria = 'Medio Alcance';
    ELSE
        SET v_categoria = 'Largo Alcance';
    END IF;

    RETURN v_categoria;
END //
DELIMITER ;