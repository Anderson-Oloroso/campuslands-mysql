-- Campuslands MySQL - Avanzado Ejercicio 056
-- Expresiones de Tabla Comunes (CTE) para Videojuego RPG

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Limpieza preventiva de tablas
DROP TABLE IF EXISTS registro_misiones;
DROP TABLE IF EXISTS misiones;
DROP TABLE IF EXISTS personajes;
DROP TABLE IF EXISTS jugadores;

-- 1. Tabla: Jugadores / Cuentas
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    nivel_cuenta INT NOT NULL DEFAULT 1,
    oro_acumulado INT NOT NULL DEFAULT 0,
    estado ENUM('Activo', 'Baneado', 'Inactivo') NOT NULL DEFAULT 'Activo',
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_nivel_cuenta CHECK (nivel_cuenta >= 1),
    CONSTRAINT chk_oro CHECK (oro_acumulado >= 0)
) ENGINE=InnoDB;

-- 2. Tabla: Personajes del Jugador
CREATE TABLE personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    nombre_personaje VARCHAR(60) NOT NULL,
    clase ENUM('Guerrero', 'Mago', 'Pistolero', 'Nigromante', 'Paladín') NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    puntos_experiencia INT NOT NULL DEFAULT 0,
    fuerza INT NOT NULL,
    inteligencia INT NOT NULL,
    agilidad INT NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_nivel_pj CHECK (nivel BETWEEN 1 AND 100)
) ENGINE=InnoDB;

-- 3. Tabla: Misiones
CREATE TABLE misiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    dificultad ENUM('Fácil', 'Normal', 'Difícil', 'Leyenda', 'Raid') NOT NULL DEFAULT 'Normal',
    experiencia_recompensa INT NOT NULL,
    oro_recompensa INT NOT NULL,
    nivel_requerido INT NOT NULL DEFAULT 1,
    CONSTRAINT chk_exp CHECK (experiencia_recompensa > 0),
    CONSTRAINT chk_oro_mision CHECK (oro_recompensa >= 0)
) ENGINE=InnoDB;

-- 4. Tabla: Registro de Misiones Completadas por Personaje
CREATE TABLE registro_misiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    mision_id INT NOT NULL,
    tiempo_completado_min DECIMAL(5,2) NOT NULL,
    estado ENUM('En Progreso', 'Completada', 'Fallida') NOT NULL DEFAULT 'En Progreso',
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (personaje_id) REFERENCES personajes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mision_id) REFERENCES misiones(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_tiempo CHECK (tiempo_completado_min > 0)
) ENGINE=InnoDB;