-- Campuslands MySQL - intermedio ejercicio 026
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE clases_personaje (
    clase_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(50) NOT NULL UNIQUE,
    rol_principal VARCHAR(30) NOT NULL CONSTRAINT chk_rol CHECK (rol_principal IN ('Tanque', 'DPS Físico', 'DPS Mágico', 'Soporte', 'Sanador')),
    bonificador_atributos VARCHAR(100) NOT NULL
);

CREATE TABLE jugadores_rpg (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nivel_cuenta INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel_cuenta CHECK (nivel_cuenta BETWEEN 1 AND 100),
    fecha_registro DATE NOT NULL
);

CREATE TABLE personajes_rpg (
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    clase_id INT NOT NULL,
    nombre_personaje VARCHAR(50) NOT NULL,
    nivel INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel_personaje CHECK (nivel BETWEEN 1 AND 100),
    puntos_vida_max INT NOT NULL CONSTRAINT chk_puntos_vida CHECK (puntos_vida_max >= 100),
    puntos_mana_max INT NOT NULL CONSTRAINT chk_puntos_mana CHECK (puntos_mana_max >= 0),
    oro_acumulado DECIMAL(12,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_oro CHECK (oro_acumulado >= 0.00),
    CONSTRAINT fk_personajes_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_rpg(jugador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_personajes_clases 
        FOREIGN KEY (clase_id) REFERENCES clases_personaje(clase_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_jugador_personaje 
        UNIQUE (jugador_id, nombre_personaje)
);

CREATE TABLE equipamiento_personaje (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    nombre_item VARCHAR(100) NOT NULL,
    tipo_slot VARCHAR(30) NOT NULL CONSTRAINT chk_tipo_slot CHECK (tipo_slot IN ('Casco', 'Armadura', 'Pantalones', 'Arma Principal', 'Escudo', 'Accesorio')),
    raridad VARCHAR(20) NOT NULL CONSTRAINT chk_raridad CHECK (raridad IN ('Común', 'Raro', 'Épico', 'Legendario', 'Mítico')),
    nivel_requerido INT NOT NULL CONSTRAINT chk_nivel_req CHECK (nivel_requerido BETWEEN 1 AND 100),
    ataque_base INT NOT NULL DEFAULT 0 CONSTRAINT chk_ataque CHECK (ataque_base >= 0),
    defensa_base INT NOT NULL DEFAULT 0 CONSTRAINT chk_defensa CHECK (defensa_base >= 0),
    CONSTRAINT fk_equipamiento_personajes 
        FOREIGN KEY (personaje_id) REFERENCES personajes_rpg(personaje_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);
