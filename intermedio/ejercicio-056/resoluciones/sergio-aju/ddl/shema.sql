-- Campuslands MySQL - Intermedio Ejercicio 056
-- Temática: Videojuego RPG (Validaciones con CHECK)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_personaje;
DROP TABLE IF EXISTS equipamiento;
DROP TABLE IF EXISTS personajes;
DROP TABLE IF EXISTS clases_rpg;

-- Tabla de Clases de Personajes
CREATE TABLE clases_rpg (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(50) NOT NULL UNIQUE,
    rol ENUM('Tanque', 'DPS Físico', 'DPS Mágico', 'Soporte', 'Híbrido') NOT NULL,
    multiplicador_danio DECIMAL(3,2) NOT NULL DEFAULT 1.00 CHECK (multiplicador_danio BETWEEN 0.50 AND 3.00)
);

-- Tabla de Personajes Jugables (Uso intensivo de restricciones CHECK)
CREATE TABLE personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(60) NOT NULL UNIQUE,
    clase_id INT NOT NULL,
    nivel INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel_rango CHECK (nivel BETWEEN 1 AND 100),
    puntos_vida_max INT NOT NULL CONSTRAINT chk_hp_positivo CHECK (puntos_vida_max > 0),
    puntos_vida_actual INT NOT NULL,
    puntos_mana_max INT NOT NULL CONSTRAINT chk_mana_positivo CHECK (puntos_mana_max >= 0),
    puntos_mana_actual INT NOT NULL,
    fuerza INT NOT NULL CONSTRAINT chk_fuerza CHECK (fuerza BETWEEN 1 AND 999),
    agilidad INT NOT NULL CONSTRAINT chk_agilidad CHECK (agilidad BETWEEN 1 AND 999),
    inteligencia INT NOT NULL CONSTRAINT chk_inteligencia CHECK (inteligencia BETWEEN 1 AND 999),
    probabilidad_critico DECIMAL(4,2) NOT NULL DEFAULT 5.00 CONSTRAINT chk_critico_porcentaje CHECK (probabilidad_critico BETWEEN 0.00 AND 100.00),
    oro_acumulado DECIMAL(12,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_oro_positivo CHECK (oro_acumulado >= 0.00),
    estado ENUM('Activo', 'Derrotado', 'En Descanso', 'Baneado') NOT NULL DEFAULT 'Activo',
    FOREIGN KEY (clase_id) REFERENCES clases_rpg(id) ON DELETE CASCADE,
    
    -- Validaciones de Lógica de Juego (Salud/Maná Actual <= Máximo)
    CONSTRAINT chk_hp_coherencia CHECK (puntos_vida_actual BETWEEN 0 AND puntos_vida_max),
    CONSTRAINT chk_mana_coherencia CHECK (puntos_mana_actual BETWEEN 0 AND puntos_mana_max)
);

-- Tabla de Equipamiento
CREATE TABLE equipamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_item VARCHAR(80) NOT NULL UNIQUE,
    tipo ENUM('Arma', 'Armadura', 'Escudo', 'Accesorio', 'Consumible') NOT NULL,
    rareza ENUM('Común', 'Raro', 'Épico', 'Legendario', 'Mítico') NOT NULL DEFAULT 'Común',
    nivel_requerido INT NOT NULL DEFAULT 1 CONSTRAINT chk_item_nivel CHECK (nivel_requerido BETWEEN 1 AND 100),
    bono_ataque INT NOT NULL DEFAULT 0 CONSTRAINT chk_bono_ataque CHECK (bono_ataque >= 0),
    bono_defensa INT NOT NULL DEFAULT 0 CONSTRAINT chk_bono_defensa CHECK (bono_defensa >= 0),
    precio_tienda DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_item CHECK (precio_tienda >= 0.00)
);

-- Tabla Intermedia: Inventario de Personajes
CREATE TABLE inventario_personaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    equipamiento_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CONSTRAINT chk_cantidad_inventario CHECK (cantidad BETWEEN 1 AND 99),
    esta_equipado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (personaje_id) REFERENCES personajes(id) ON DELETE CASCADE,
    FOREIGN KEY (equipamiento_id) REFERENCES equipamiento(id) ON DELETE CASCADE,
    CONSTRAINT uk_personaje_item UNIQUE (personaje_id, equipamiento_id)
);