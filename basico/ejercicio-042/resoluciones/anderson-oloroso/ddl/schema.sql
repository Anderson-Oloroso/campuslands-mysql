USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS canciones_playlist(
    cancion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_cancion VARCHAR(100) NOT NULL,
    artista VARCHAR(50) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    reproducciones DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
