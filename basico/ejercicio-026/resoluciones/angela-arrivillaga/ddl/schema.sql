CREATE DATABASE IF NOT EXISTS rpg_videojuego_db;
USE rpg_videojuego_db;

CREATE TABLE personajes_rpg (
    id_personaje INT PRIMARY KEY AUTO_INCREMENT,
    codigo_personaje VARCHAR(20) NOT NULL UNIQUE,
    nombre_personaje VARCHAR(50) NOT NULL,
    clase_personaje VARCHAR(30) NOT NULL,
    nivel_actual INT NOT NULL,
    experiencia_acumulada INT NOT NULL,
    estado_jugador ENUM('activo', 'en_combate', 'inactivo', 'baneado') DEFAULT 'activo',
    CONSTRAINT chk_nivel CHECK (nivel_actual >= 1 AND nivel_actual <= 100),
    CONSTRAINT chk_experiencia CHECK (experiencia_acumulada >= 0)
);