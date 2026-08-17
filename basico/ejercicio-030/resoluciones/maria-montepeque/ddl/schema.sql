-- Campuslands MySQL - basico ejercicio 030
-- Resolucion: maria-montepeque
-- Tema: equipo de streaming
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS transmisiones_basico;
DROP TABLE IF EXISTS streamers_basico;

CREATE TABLE streamers_basico (
  id_streamer INT AUTO_INCREMENT PRIMARY KEY,
  nombre_canal VARCHAR(120) NOT NULL UNIQUE,
  categoria_principal ENUM('juegos','musica','arte','programacion','variedad') NOT NULL,
  seguidores INT NOT NULL DEFAULT 0,
  CONSTRAINT chk_streamers_basico_seguidores CHECK (seguidores >= 0)
);

-- Relacion simple 1 a N: cada transmision pertenece a un solo
-- streamer, y un streamer puede tener muchas transmisiones.
CREATE TABLE transmisiones_basico (
  id_transmision INT AUTO_INCREMENT PRIMARY KEY,
  id_streamer INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  duracion_min INT NOT NULL,
  espectadores_pico INT NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT fk_transmisiones_basico_streamer FOREIGN KEY (id_streamer) REFERENCES streamers_basico (id_streamer),
  CONSTRAINT chk_transmisiones_basico_duracion CHECK (duracion_min > 0),
  CONSTRAINT chk_transmisiones_basico_espectadores CHECK (espectadores_pico >= 0)
);
