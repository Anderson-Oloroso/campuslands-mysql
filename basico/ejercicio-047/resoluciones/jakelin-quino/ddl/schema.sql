-- Ejercicio 047 - Básico - Tipos de Datos Tienda de Ropa
CREATE TABLE `ejercicio-047-bas-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    talla CHAR(2) DEFAULT 'M',
    precio DECIMAL(8,2) DEFAULT 0,
    stock INT DEFAULT 0,
    disponible BOOLEAN DEFAULT TRUE,
    fecha_ingreso DATE DEFAULT (CURRENT_DATE)
);