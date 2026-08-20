-- Ejercicio 052 - Avanzado - Vistas Avanzadas Animación 3D
CREATE TABLE `ejercicio-052-adv-proyectos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    estudio VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(12,2) DEFAULT 0,
    fecha_inicio DATE NOT NULL
);

CREATE TABLE `ejercicio-052-adv-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    proyecto_id INT,
    poligonos INT DEFAULT 0,
    tiempo_animacion INT DEFAULT 0,
    FOREIGN KEY (proyecto_id) REFERENCES `ejercicio-052-adv-proyectos`(id)
);