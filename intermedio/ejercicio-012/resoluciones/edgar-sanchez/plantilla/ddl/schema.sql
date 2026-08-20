CREATE TABLE usuarios_playlist (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    tipo_suscripcion VARCHAR(20) NOT NULL DEFAULT 'Gratuito' CONSTRAINT chk_tipo_suscripcion CHECK (tipo_suscripcion IN ('Gratuito', 'Premium', 'Familiar')),
    fecha_registro DATE NOT NULL
);

CREATE TABLE artistas_playlist (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL UNIQUE,
    genero_principal VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);

CREATE TABLE canciones_playlist (
    cancion_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    titulo_cancion VARCHAR(100) NOT NULL,
    duracion_segundos INT NOT NULL CONSTRAINT chk_duracion_segundos CHECK (duracion_segundos > 0),
    album VARCHAR(100) NOT NULL,
    es_explicita BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_canciones_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_playlist(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE playlists_musica (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre_playlist VARCHAR(100) NOT NULL,
    es_publica BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion DATE NOT NULL,
    CONSTRAINT fk_playlists_usuarios 
        FOREIGN KEY (usuario_id) REFERENCES usuarios_playlist(usuario_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE elementos_playlist (
    elemento_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    cancion_id INT NOT NULL,
    orden_reproduccion INT NOT NULL CONSTRAINT chk_orden_reproduccion CHECK (orden_reproduccion > 0),
    fecha_agregado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_elementos_playlists 
        FOREIGN KEY (playlist_id) REFERENCES playlists_musica(playlist_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_elementos_canciones 
        FOREIGN KEY (cancion_id) REFERENCES canciones_playlist(cancion_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_playlist_cancion 
        UNIQUE (playlist_id, cancion_id),
    CONSTRAINT uq_playlist_orden 
        UNIQUE (playlist_id, orden_reproduccion)
);