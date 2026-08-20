CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas previas respetando el orden de dependencia para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS videojuegos_biblioteca;
DROP TABLE IF EXISTS generos_biblioteca;

-- 1. Tabla Independiente: Géneros de Videojuegos
CREATE TABLE generos_biblioteca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_genero VARCHAR(50) NOT NULL UNIQUE,
  descripcion TEXT NOT NULL
);

-- 2. Tabla Dependiente: Videojuegos (Relación 1:N con géneros)
CREATE TABLE videojuegos_biblioteca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_juego VARCHAR(20) NOT NULL UNIQUE,
  titulo VARCHAR(100) NOT NULL,
  genero_id INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion DECIMAL(3,1) NOT NULL,
  fecha_lanzamiento DATE NOT NULL,
  estado_biblioteca ENUM('instalado', 'pendiente_descarga', 'completado', 'archivado') NOT NULL DEFAULT 'instalado',
  CONSTRAINT fk_videojuego_genero FOREIGN KEY (genero_id) REFERENCES generos_biblioteca(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_precio_gamer CHECK (precio >= 0.00),
  CONSTRAINT chk_calificacion CHECK (calificacion >= 0.0 AND calificacion <= 10.0)
);