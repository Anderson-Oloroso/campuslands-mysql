USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS personajes_rpg(
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(100) NOT NULL,
    clase VARCHAR(50) NOT NULL,
    nivel VARCHAR(100) NOT NULL,
    oro DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS inventario_rpg(
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    nombre_objeto VARCHAR(100) NOT NULL,
    rareza VARCHAR(50) NOT NULL,
    valor_oro DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_inventario_rpg_personajes_rpg FOREIGN KEY (personaje_id) REFERENCES personajes_rpg(personaje_id) ON DELETE CASCADE
);
