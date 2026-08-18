-- Ejercicio 029 - Básico - Fechas Básicas Marketplace Accesorios
CREATE TABLE `ejercicio-029-bas-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    fecha_publicacion DATE NOT NULL,
    fecha_actualizacion DATE
);