-- Ejercicio 023 - Avanzado - Roles y Permisos Arquitectura 3D
CREATE TABLE `ejercicio-023-adv-edificios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    altura INT DEFAULT 0
);

CREATE TABLE `ejercicio-023-adv_usuarios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    rol VARCHAR(20) NOT NULL
);