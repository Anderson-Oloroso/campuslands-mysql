-- Ejercicio 024 - Avanzado - Bloqueos Soldadura
CREATE TABLE `ejercicio-024-adv-proyectos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    temperatura INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'activo'
);