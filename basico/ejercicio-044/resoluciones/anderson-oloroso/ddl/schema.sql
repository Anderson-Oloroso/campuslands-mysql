USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS personajes_scifi(
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    planeta_origen VARCHAR(100) NOT NULL,
    nivel_poder DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
