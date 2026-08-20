-- Ejercicio 022 - Intermedio - Normalización 2FN Animación 3D

-- Tabla de estudios
CREATE TABLE `ejercicio-022-int-estudios` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(30) NOT NULL
);

-- Tabla de proyectos (depende de estudio)
CREATE TABLE `ejercicio-022-int-proyectos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    estudio_id INT,
    presupuesto DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (estudio_id) REFERENCES `ejercicio-022-int-estudios`(id)
);

-- Tabla de personajes (depende de proyecto)
CREATE TABLE `ejercicio-022-int-personajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    proyecto_id INT,
    poligonos INT DEFAULT 0,
    tiempo_animacion INT DEFAULT 0,
    FOREIGN KEY (proyecto_id) REFERENCES `ejercicio-022-int-proyectos`(id)
);