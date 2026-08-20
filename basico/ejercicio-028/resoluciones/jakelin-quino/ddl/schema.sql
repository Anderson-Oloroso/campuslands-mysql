-- Ejercicio 028 - Básico - Filtros por Estado Academia Tech
CREATE TABLE `ejercicio-028-bas-cursos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel VARCHAR(30) NOT NULL,
    duracion INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'activo'
);