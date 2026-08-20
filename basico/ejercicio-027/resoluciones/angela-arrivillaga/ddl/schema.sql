CREATE DATABASE IF NOT EXISTS juego_accion_aventura_db;
USE juego_accion_aventura_db;

CREATE TABLE artefactos_aventura (
    id_artefacto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_artefacto VARCHAR(20) NOT NULL UNIQUE,
    nombre_artefacto VARCHAR(100) NOT NULL,
    tipo_artefacto VARCHAR(40) NOT NULL,
    nivel_poder INT NOT NULL,
    valor_monedas DECIMAL(10,2) NOT NULL,
    estado_disponibilidad ENUM('disponible', 'equipado', 'roto', 'perdido') DEFAULT 'disponible',
    CONSTRAINT chk_nivel_poder CHECK (nivel_poder >= 1 AND nivel_poder <= 1000),
    CONSTRAINT chk_valor_monedas CHECK (valor_monedas >= 0.00)
);