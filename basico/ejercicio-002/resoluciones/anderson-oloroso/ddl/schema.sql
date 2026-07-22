USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS rankingBR(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(100) NOT NULL,
  puesto INT NOT NULL,
  puntos INT NOT NULL,
  cantidad_kills INT NOT NULL,
  cantidad_muertes INT NOT NULL
)