-- Ejercicio 028 - Avanzado - JSON Academia Tech
CREATE TABLE `ejercicio-028-adv-estudiantes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    progreso JSON
);