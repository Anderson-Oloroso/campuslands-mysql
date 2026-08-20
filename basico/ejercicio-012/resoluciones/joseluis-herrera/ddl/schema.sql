CREATE DATABASE IF NOT EXISTS playlist_db;
USE playlist_db;


CREATE TABLE usuarios (
	usuario_id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	pais VARCHAR(50) NOT NULL
);

CREATE TABLE playlists (
	playlist_id INT AUTO_INCREMENT PRIMARY KEY,
	usuario_id INT NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	visibilidad VARCHAR(20) DEFAULT 'Publica' CHECK (visibilidad IN ('Publica', 'Privada')),
	fecha_creacion DATE NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE canciones (
	cancion_id INT AUTO_INCREMENT PRIMARY KEY,
	playlist_id INT NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	artista VARCHAR(100) NOT NULL,
	duracion_segundos INT CHECK (duracion_segundos > 0),
	FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id)
);
