-- Ejercicio 029 - Avanzado - Event Scheduler Marketplace Accesorios
CREATE TABLE `ejercicio-029-adv-productos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    stock INT DEFAULT 0,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `ejercicio-029-adv_log` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mensaje VARCHAR(100) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);