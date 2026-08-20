-- Campuslands MySQL - Intermedio Ejercicio 050
-- Temática: Estudio de Tatuajes (Uso de Subconsultas)
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;
DROP TABLE IF EXISTS estilos_tatuaje;
DROP TABLE IF EXISTS tatuadores;
DROP TABLE IF EXISTS clientes;

-- Tabla de clientes del estudio
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla de tatuadores
CREATE TABLE tatuadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    tarifa_hora DECIMAL(10,2) NOT NULL CHECK (tarifa_hora > 0.00),
    experiencia_anios INT NOT NULL CHECK (experiencia_anios >= 0)
);

-- Tabla de estilos de tatuajes
CREATE TABLE estilos_tatuaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estilo VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL
);

-- Tabla de citas y sesiones de tatuajes
CREATE TABLE citas_tatuajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tatuador_id INT NOT NULL,
    estilo_id INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    duracion_horas DECIMAL(4,2) NOT NULL CHECK (duracion_horas > 0.00),
    costo_total DECIMAL(10,2) NOT NULL CHECK (costo_total >= 0.00),
    estado ENUM('Finalizada', 'Pendiente', 'Cancelada') NOT NULL DEFAULT 'Finalizada',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (tatuador_id) REFERENCES tatuadores(id) ON DELETE CASCADE,
    FOREIGN KEY (estilo_id) REFERENCES estilos_tatuaje(id) ON DELETE CASCADE
);