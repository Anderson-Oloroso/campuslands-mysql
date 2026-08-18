USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS personajes_rpg(
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(100) NOT NULL,
    clase VARCHAR(50) NOT NULL,
    nivel VARCHAR(100) NOT NULL,
    oro DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
