-- Ejercicio 050 - Básico - SELECT Estudio de Tatuajes
CREATE TABLE `ejercicio-050-bas-tatuajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(50) NOT NULL,
    diseno VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    artista VARCHAR(50) NOT NULL
);