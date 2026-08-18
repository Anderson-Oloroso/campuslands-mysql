-- Ejercicio 044 - Básico - Fechas Básicas Saga Ciencia Ficción
CREATE TABLE `ejercicio-044-bas-peliculas` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(50) NOT NULL,
    fecha_estreno DATE NOT NULL,
    fecha_remasterizacion DATE,
    año_lanzamiento YEAR,
    duracion INT DEFAULT 120,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);