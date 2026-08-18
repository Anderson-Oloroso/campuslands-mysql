-- Ejercicio 018 - Intermedio - GROUP BY Viajes y Turismo
CREATE TABLE `ejercicio-018-int-destinos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    precio DECIMAL(10,2) DEFAULT 0,
    categoria VARCHAR(30) DEFAULT 'economico'
);

