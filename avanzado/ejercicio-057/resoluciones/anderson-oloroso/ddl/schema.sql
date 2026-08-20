USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS niveles_aventura(
    nivel_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nivel VARCHAR(100) NOT NULL,
    mundo VARCHAR(50) NOT NULL,
    dificultad VARCHAR(100) NOT NULL,
    puntos_recompensa DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS logros_nivel(
    logro_id INT AUTO_INCREMENT PRIMARY KEY,
    nivel_id INT NOT NULL,
    titulo_logro VARCHAR(100) NOT NULL,
    puntos_gamerscore VARCHAR(50) NOT NULL,
    desbloqueado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_logros_nivel_niveles_aventura FOREIGN KEY (nivel_id) REFERENCES niveles_aventura(nivel_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_niveles_aventura(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    nivel_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
