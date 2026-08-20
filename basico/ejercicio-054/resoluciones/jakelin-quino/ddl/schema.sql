-- Ejercicio 054 - Básico - DELETE Controlado Soldadura
CREATE TABLE `ejercicio-054-bas-proyectos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    material VARCHAR(30) NOT NULL,
    temperatura INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'activo'
);