-- Ejercicio 021 - Intermedio - Normalización 1FN Dibujo Digital
CREATE TABLE `ejercicio-021-int-artistas` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL
);

CREATE TABLE `ejercicio-021-int-dibujos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    artista_id INT,
    tecnica VARCHAR(30) DEFAULT 'digital',
    precio DECIMAL(8,2) DEFAULT 0,
    tamanio VARCHAR(20) DEFAULT 'mediano',
    FOREIGN KEY (artista_id) REFERENCES `ejercicio-021-int-artistas`(id)
);