-- Campuslands MySQL - Intermedio Ejercicio 057
-- Temática: Videojuego de Acción y Aventura (Consultas de Reportes)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS bitacora_misiones;
DROP TABLE IF EXISTS inventario_jugador;
DROP TABLE IF EXISTS objetos_coleccionables;
DROP TABLE IF EXISTS misiones;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS regiones;

-- Tabla de Regiones / Mapas del Juego
CREATE TABLE regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_region VARCHAR(60) NOT NULL UNIQUE,
    nivel_dificultad ENUM('Principiante', 'Intermedio', 'Avanzado', 'Pesadilla') NOT NULL DEFAULT 'Principiante',
    clima_predominante VARCHAR(40) NOT NULL DEFAULT 'Templado'
);

-- Tabla de Jugadores
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nivel_explorador INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel_explorador CHECK (nivel_explorador BETWEEN 1 AND 100),
    puntos_experiencia INT NOT NULL DEFAULT 0 CONSTRAINT chk_exp_positiva CHECK (puntos_experiencia >= 0),
    horas_jugadas DECIMAL(6,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_horas_positivas CHECK (horas_jugadas >= 0.00),
    monedas_oro DECIMAL(10,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_oro_positivo CHECK (monedas_oro >= 0.00),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_cuenta ENUM('Activa', 'Inactiva', 'Suspendida') NOT NULL DEFAULT 'Activa'
);

-- Tabla de Misiones de Acción y Aventura
CREATE TABLE misiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    tipo_mision ENUM('Principal', 'Secundaria', 'Desafío Boss', 'Exploración') NOT NULL,
    recompensa_exp INT NOT NULL CONSTRAINT chk_exp_mision CHECK (recompensa_exp > 0),
    recompensa_oro DECIMAL(8,2) NOT NULL CONSTRAINT chk_oro_mision CHECK (recompensa_oro >= 0.00),
    tiempo_estimado_min INT NOT NULL CONSTRAINT chk_tiempo_mision CHECK (tiempo_estimado_min > 0),
    FOREIGN KEY (region_id) REFERENCES regiones(id) ON DELETE CASCADE
);

-- Tabla de Objetos / Equipamiento
CREATE TABLE objetos_coleccionables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_objeto VARCHAR(80) NOT NULL UNIQUE,
    categoria ENUM('Arma Melee', 'Arma Distancia', 'Reliquia', 'Herramienta Exploración', 'Poción') NOT NULL,
    rareza ENUM('Común', 'Raro', 'Épico', 'Legendario') NOT NULL DEFAULT 'Común',
    valor_mercado DECIMAL(8,2) NOT NULL CONSTRAINT chk_valor_objeto CHECK (valor_mercado >= 0.00)
);

-- Tabla Intermedia: Registro de Misiones por Jugador
CREATE TABLE bitacora_misiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    mision_id INT NOT NULL,
    estado_mision ENUM('En Progreso', 'Completada', 'Fallida', 'Abandonada') NOT NULL DEFAULT 'En Progreso',
    intentos INT NOT NULL DEFAULT 1 CONSTRAINT chk_intentos CHECK (intentos >= 1),
    tiempo_empleado_min INT NULL,
    fecha_completado DATETIME NULL,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE,
    FOREIGN KEY (mision_id) REFERENCES misiones(id) ON DELETE CASCADE,
    CONSTRAINT uk_jugador_mision UNIQUE (jugador_id, mision_id)
);

-- Tabla Intermedia: Inventario de Jugadores
CREATE TABLE inventario_jugador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    objeto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CONSTRAINT chk_cantidad_inv CHECK (cantidad BETWEEN 1 AND 99),
    esta_equipado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE,
    FOREIGN KEY (objeto_id) REFERENCES objetos_coleccionables(id) ON DELETE CASCADE,
    CONSTRAINT uk_jugador_objeto UNIQUE (jugador_id, objeto_id)
);