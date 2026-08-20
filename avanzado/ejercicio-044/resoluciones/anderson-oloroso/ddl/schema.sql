USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS personajes_scifi(
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_personaje VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    planeta_origen VARCHAR(100) NOT NULL,
    nivel_poder DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS misiones_scifi(
    mision_id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    nombre_mision VARCHAR(100) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    recompensa DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_misiones_scifi_personajes_scifi FOREIGN KEY (personaje_id) REFERENCES personajes_scifi(personaje_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_personajes_scifi(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
