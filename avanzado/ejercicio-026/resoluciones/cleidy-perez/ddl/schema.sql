-- Campuslands MySQL - avanzado ejercicio 026
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS rpg_game_db;
USE rpg_game_db;

-- 1. Tabla Clases de Personajes (CHECK en modificadores de atributo)
CREATE TABLE IF NOT EXISTS clases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    bonificador_fuerza INT DEFAULT 0 CONSTRAINT chk_bonif_fuerza CHECK (bonificador_fuerza BETWEEN -5 AND 15),
    bonificador_magia INT DEFAULT 0 CONSTRAINT chk_bonif_magia CHECK (bonificador_magia BETWEEN -5 AND 15)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabla Jugadores / Personajes (CHECK en niveles, puntos de vida y mana)
CREATE TABLE IF NOT EXISTS personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL UNIQUE,
    id_clase INT NOT NULL,
    nivel INT DEFAULT 1 CONSTRAINT chk_nivel CHECK (nivel BETWEEN 1 AND 100),
    puntos_vida_actual INT NOT NULL,
    puntos_vida_max INT NOT NULL,
    mana_actual INT NOT NULL,
    mana_max INT NOT NULL,
    puntos_experiencia INT DEFAULT 0 CONSTRAINT chk_exp CHECK (puntos_experiencia >= 0),
    CONSTRAINT fk_personajes_clases FOREIGN KEY (id_clase) REFERENCES clases(id) ON DELETE RESTRICT,
    CONSTRAINT chk_vida_valida CHECK (puntos_vida_actual <= puntos_vida_max AND puntos_vida_actual >= 0),
    CONSTRAINT chk_mana_valido CHECK (mana_actual <= mana_max AND mana_actual >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla Equipamiento / Objetos (CHECK en durabilidad, precio y nivel mínimo)
CREATE TABLE IF NOT EXISTS objetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_objeto VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Arma', 'Armadura', 'Poción', 'Accesorio') NOT NULL,
    nivel_requerido INT DEFAULT 1 CONSTRAINT chk_nivel_req CHECK (nivel_requerido BETWEEN 1 AND 100),
    precio_oro INT NOT NULL CONSTRAINT chk_precio CHECK (precio_oro >= 0),
    durabilidad_actual INT DEFAULT 100,
    durabilidad_max INT DEFAULT 100,
    CONSTRAINT chk_durabilidad CHECK (durabilidad_actual <= durabilidad_max AND durabilidad_actual >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla Ejercicios Prácticos
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    tematica VARCHAR(100) NOT NULL,
    recompensa_exp INT DEFAULT 100 CONSTRAINT chk_recompensa_exp CHECK (recompensa_exp > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla Inventario de Personajes (CHECK en cantidad de ítems)
CREATE TABLE IF NOT EXISTS inventarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_personaje INT NOT NULL,
    id_objeto INT NOT NULL,
    cantidad INT DEFAULT 1 CONSTRAINT chk_cantidad CHECK (cantidad BETWEEN 1 AND 99),
    CONSTRAINT fk_inv_personaje FOREIGN KEY (id_personaje) REFERENCES personajes(id) ON DELETE CASCADE,
    CONSTRAINT fk_inv_objeto FOREIGN KEY (id_objeto) REFERENCES objetos(id) ON DELETE RESTRICT,
    CONSTRAINT uq_personaje_objeto UNIQUE (id_personaje, id_objeto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
