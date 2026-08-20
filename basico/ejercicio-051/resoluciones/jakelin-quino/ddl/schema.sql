-- Ejercicio 051 - Básico - WHERE Dibujo Digital
CREATE TABLE `ejercicio-051-bas-dibujos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    artista VARCHAR(50) NOT NULL,
    tecnica VARCHAR(30) DEFAULT 'digital',
    precio DECIMAL(8,2) DEFAULT 0,
    tamanio VARCHAR(20) DEFAULT 'mediano'
);