DROP DATABASE IF EXISTS battle_royale_basico_db;
CREATE DATABASE battle_royale_basico_db;
USE battle_royale_basico_db;

CREATE TABLE jugadores_br (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    puntos_ranking INT NOT NULL,
    eliminaciones_totales INT NOT NULL,
    precision_disparo DECIMAL(5, 2) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    estado_cuenta VARCHAR(20) NOT NULL,
    CONSTRAINT chk_puntos_positivos CHECK (puntos_ranking >= 0),
    CONSTRAINT chk_eliminaciones_no_negativas CHECK (eliminaciones_totales >= 0),
    CONSTRAINT chk_precision_rango CHECK (precision_disparo BETWEEN 0.00 AND 100.00),
    CONSTRAINT chk_estado_cuenta CHECK (estado_cuenta IN ('Activo', 'Suspendido', 'Leyenda'))
);
