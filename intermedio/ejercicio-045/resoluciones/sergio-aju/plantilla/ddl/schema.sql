CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas previas respetando el orden de dependencia para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS detalle_biblioteca_juegos;
DROP TABLE IF EXISTS plataformas_gamer;
DROP TABLE IF EXISTS generos_biblioteca;

-- 1. Tabla Independiente 1: Géneros de Videojuegos
CREATE TABLE generos_biblioteca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_genero VARCHAR(50) NOT NULL UNIQUE,
  descripcion TEXT NOT NULL
);

-- 2. Tabla Independiente 2: Plataformas Gamer
CREATE TABLE plataformas_gamer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
  tipo_sistema VARCHAR(30) NOT NULL -- Ej: PC, Consola, Cloud
);

-- 3. Tabla Principal / Relacional: Detalle y Catálogo de Videojuegos
CREATE TABLE detalle_biblioteca_juegos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_juego VARCHAR(20) NOT NULL UNIQUE,
  titulo VARCHAR(100) NOT NULL,
  genero_id INT NOT NULL,
  plataforma_id INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion DECIMAL(3,1) NOT NULL,
  horas_jugadas INT NOT NULL DEFAULT 0,
  fecha_adquisicion DATE NOT NULL,
  estado_biblioteca ENUM('instalado', 'pendiente_descarga', 'completado', 'archivado') NOT NULL DEFAULT 'instalado',
  CONSTRAINT fk_juego_genero FOREIGN KEY (genero_id) REFERENCES generos_biblioteca(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_juego_plataforma FOREIGN KEY (plataforma_id) REFERENCES plataformas_gamer(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_precio_gamer CHECK (precio >= 0.00),
  CONSTRAINT chk_calificacion CHECK (calificacion >= 0.0 AND calificacion <= 10.0),
  CONSTRAINT chk_horas_jugadas CHECK (horas_jugadas >= 0)
);