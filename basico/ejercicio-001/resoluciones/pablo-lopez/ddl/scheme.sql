USE campuslands_mysql;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    region VARCHAR(30) NOT NULL,
    puntaje DECIMAL(5,2) NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    estado ENUM('Activo', 'Eliminado') NOT NULL
);