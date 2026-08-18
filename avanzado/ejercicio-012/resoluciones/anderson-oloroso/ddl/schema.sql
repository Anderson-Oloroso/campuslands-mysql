USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS canciones_playlist(
    cancion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_cancion VARCHAR(100) NOT NULL,
    artista VARCHAR(50) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    reproducciones DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS detalles_playlist(
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    cancion_id INT NOT NULL,
    nombre_playlist VARCHAR(100) NOT NULL,
    orden_cancion VARCHAR(50) NOT NULL,
    fecha_agregado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_detalles_playlist_canciones_playlist FOREIGN KEY (cancion_id) REFERENCES canciones_playlist(cancion_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_canciones_playlist(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    cancion_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
