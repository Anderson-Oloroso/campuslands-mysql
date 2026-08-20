DROP TABLE IF EXISTS inventario_jugadores;
DROP TABLE IF EXISTS misiones_completadas;
DROP TABLE IF EXISTS items_juego;
DROP TABLE IF EXISTS misiones_rpg;
DROP TABLE IF EXISTS jugadores_rpg;

CREATE TABLE jugadores_rpg (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    clase_personaje VARCHAR(40) NOT NULL CONSTRAINT chk_clase CHECK (clase_personaje IN ('Guerrero', 'Mago', 'Arquero', 'Pícaro', 'Clérigo')),
    nivel INT NOT NULL DEFAULT 1 CONSTRAINT chk_nivel CHECK (nivel BETWEEN 1 AND 100),
    puntos_experiencia INT NOT NULL DEFAULT 0 CONSTRAINT chk_xp CHECK (puntos_experiencia >= 0),
    oro_acumulado INT NOT NULL DEFAULT 0 CONSTRAINT chk_oro CHECK (oro_acumulado >= 0)
);

CREATE TABLE misiones_rpg (
    mision_id INT AUTO_INCREMENT PRIMARY KEY,
    mision_padre_id INT NULL,
    titulo_mision VARCHAR(100) NOT NULL,
    nivel_requerido INT NOT NULL DEFAULT 1 CONSTRAINT chk_mision_nivel CHECK (nivel_requerido BETWEEN 1 AND 100),
    recompensa_oro INT NOT NULL DEFAULT 0 CONSTRAINT chk_recompensa_oro CHECK (recompensa_oro >= 0),
    recompensa_xp INT NOT NULL DEFAULT 0 CONSTRAINT chk_recompensa_xp CHECK (recompensa_xp >= 0),
    CONSTRAINT fk_misiones_misiones 
        FOREIGN KEY (mision_padre_id) REFERENCES misiones_rpg(mision_id) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE items_juego (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_item VARCHAR(80) NOT NULL UNIQUE,
    tipo_item VARCHAR(40) NOT NULL CONSTRAINT chk_tipo_item CHECK (tipo_item IN ('Arma', 'Armadura', 'Poción', 'Accesorio', 'Material')),
    rareza VARCHAR(30) NOT NULL DEFAULT 'Común' CONSTRAINT chk_rareza CHECK (rareza IN ('Común', 'Raro', 'Épico', 'Legendario')),
    valor_oro INT NOT NULL CONSTRAINT chk_valor_item CHECK (valor_oro >= 0)
);

CREATE TABLE misiones_completadas (
    jugador_id INT NOT NULL,
    mision_id INT NOT NULL,
    fecha_completado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (jugador_id, mision_id),
    CONSTRAINT fk_misionescomp_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_rpg(jugador_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_misionescomp_misiones 
        FOREIGN KEY (mision_id) REFERENCES misiones_rpg(mision_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE inventario_jugadores (
    inventario_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    item_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CONSTRAINT chk_cantidad_item CHECK (cantidad > 0),
    equipado BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_inventario_jugadores 
        FOREIGN KEY (jugador_id) REFERENCES jugadores_rpg(jugador_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_inventario_items 
        FOREIGN KEY (item_id) REFERENCES items_juego(item_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);