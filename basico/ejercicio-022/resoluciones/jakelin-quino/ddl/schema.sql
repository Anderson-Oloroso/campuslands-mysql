-- Ejercicio 022 - Básico - ORDER BY Animación 3D
CREATE TABLE `ejercicio-022-bas-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    pelicula VARCHAR(50) NOT NULL,
    poligonos INT DEFAULT 0,
    tiempo_animacion INT DEFAULT 0
);