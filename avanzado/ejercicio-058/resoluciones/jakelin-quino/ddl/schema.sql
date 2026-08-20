-- Ejercicio 058 - Avanzado - JSON Academia Tech
CREATE TABLE `ejercicio-058-adv-estudiantes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    progreso JSON
);