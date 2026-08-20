CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas para garantizar ejecución limpia
DROP TABLE IF EXISTS inventario_jugador;
DROP TABLE IF EXISTS objetos_juego;

-- Entidad: Objetos (armas, reliquias, pociones)
CREATE TABLE objetos_juego (
  id_objeto INT AUTO_INCREMENT PRIMARY KEY,
  nombre_objeto VARCHAR(50) NOT NULL,
  tipo_objeto ENUM('arma', 'reliquia', 'pocion', 'material') NOT NULL,
  rareza ENUM('comun', 'raro', 'epico', 'legendario') NOT NULL,
  valor_oro DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT chk_valor CHECK (valor_oro >= 0)
);

-- Entidad: Inventario (relaciona jugador y objeto)
CREATE TABLE inventario_jugador (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  nombre_jugador VARCHAR(50) NOT NULL,
  id_objeto INT NOT NULL,
  fecha_obtencion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado_item ENUM('equipado', 'mochila', 'vendido') NOT NULL DEFAULT 'mochila',
  FOREIGN KEY (id_objeto) REFERENCES objetos_juego(id_objeto)
);