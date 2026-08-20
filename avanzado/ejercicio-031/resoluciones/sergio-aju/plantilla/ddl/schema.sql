CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS historial_traspasos_moba;
DROP TABLE IF EXISTS equipos_moba_avanzado;

-- 1. Tabla Principal de Equipos MOBA con balance financiero (presupuesto para fichajes) y puntos
CREATE TABLE equipos_moba_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
  region VARCHAR(60) NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  puntos_liga INT NOT NULL DEFAULT 0,
  estado_equipo ENUM('activo', 'eliminado', 'clasificado') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_presupuesto CHECK (presupuesto >= 0.00),
  CONSTRAINT chk_puntos_avanzado CHECK (puntos_liga >= 0)
);

-- 2. Tabla Transaccional para registrar el historial de fichajes o traspasos bajo control de transacciones
CREATE TABLE historial_traspasos_moba (
  id INT AUTO_INCREMENT PRIMARY KEY,
  equipo_origen_id INT NOT NULL,
  equipo_destino_id INT NOT NULL,
  jugador_fichado VARCHAR(100) NOT NULL,
  costo_traspaso DECIMAL(10,2) NOT NULL,
  fecha_traspaso DATETIME NOT NULL,
  CONSTRAINT fk_traspaso_origen FOREIGN KEY (equipo_origen_id) REFERENCES equipos_moba_avanzado(id) ON DELETE RESTRICT,
  CONSTRAINT fk_traspaso_destino FOREIGN KEY (equipo_destino_id) REFERENCES equipos_moba_avanzado(id) ON DELETE RESTRICT,
  CONSTRAINT chk_costo_traspaso CHECK (costo_traspaso > 0.00)
);