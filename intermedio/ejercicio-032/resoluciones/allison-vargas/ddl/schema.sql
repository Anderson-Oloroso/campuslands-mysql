DROP DATABASE IF EXISTS battle_royale_left_db;
CREATE DATABASE battle_royale_left_db;
USE battle_royale_left_db;

CREATE TABLE clanes_br (
    id_clan INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clan VARCHAR(50) NOT NULL,
    tag_clan VARCHAR(10) NOT NULL UNIQUE,
    nivel_clan INT NOT NULL,
    CONSTRAINT chk_nivel_clan CHECK (nivel_clan BETWEEN 1 AND 10)
);

CREATE TABLE jugadores_br (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    id_clan INT DEFAULT NULL,
    nombre_jugador VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    puntos_ranking INT NOT NULL,
    eliminaciones_totales INT NOT NULL,
    estado_cuenta VARCHAR(20) NOT NULL,
    CONSTRAINT fk_jugador_clan FOREIGN KEY (id_clan) REFERENCES clanes_br(id_clan) ON DELETE SET NULL,
    CONSTRAINT chk_puntos_br CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_eliminaciones CHECK (eliminaciones_totales >= 0),
    CONSTRAINT chk_estado_cuenta CHECK (estado_cuenta IN ('Activo', 'Suspendido', 'Leyenda'))
);
