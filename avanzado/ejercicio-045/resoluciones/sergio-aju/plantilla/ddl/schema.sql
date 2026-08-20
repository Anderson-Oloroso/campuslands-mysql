CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas previas respetando el orden de dependencia para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS detalle_biblioteca_opt;
DROP TABLE IF EXISTS plataformas_opt;
DROP TABLE IF EXISTS generos_opt;

-- 1. Tabla Independiente 1: Géneros de Videojuegos
CREATE TABLE generos_opt (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_genero VARCHAR(50) NOT NULL UNIQUE,
  descripcion TEXT NOT NULL
);

-- 2. Tabla Independiente 2: Plataformas Gamer
CREATE TABLE plataformas_opt (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
  tipo_sistema VARCHAR(30) NOT NULL
);

-- 3. Tabla Principal con Índices Estratégicos de Optimización
CREATE TABLE detalle_biblioteca_opt (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_juego VARCHAR(20) NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  genero_id INT NOT NULL,
  plataforma_id INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion DECIMAL(3,1) NOT NULL,
  horas_jugadas INT NOT NULL DEFAULT 0,
  fecha_adquisicion DATE NOT NULL,
  estado_biblioteca ENUM('instalado', 'pendiente_descarga', 'completado', 'archivado') NOT NULL DEFAULT 'instalado',
  
  -- Restricciones de integridad referencial
  CONSTRAINT fk_opt_genero FOREIGN KEY (genero_id) REFERENCES generos_opt(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_opt_plataforma FOREIGN KEY (plataforma_id) REFERENCES plataformas_opt(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT chk_opt_precio CHECK (precio >= 0.00),
  CONSTRAINT chk_opt_calificacion CHECK (calificacion >= 0.0 AND calificacion <= 10.0),
  CONSTRAINT chk_opt_horas CHECK (horas_jugadas >= 0),
  
  -- Creación de Restricciones y Índices de Rendimiento Avanzado
  CONSTRAINT uk_codigo_juego UNIQUE (codigo_juego)
);

-- Índices optimizados para acelerar búsquedas, filtros y uniones (JOINs)
CREATE INDEX idx_opt_genero_estado ON detalle_biblioteca_opt(genero_id, estado_biblioteca);
CREATE INDEX idx_opt_plataforma ON detalle_biblioteca_opt(plataforma_id);
CREATE INDEX idx_opt_calificacion_horas ON detalle_biblioteca_opt(calificacion DESC, horas_jugadas DESC);
CREATE INDEX idx_opt_fecha_adquisicion ON detalle_biblioteca_opt(fecha_adquisicion);