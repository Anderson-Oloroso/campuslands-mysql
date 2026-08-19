-- Creación y selección de la Base de Datos
CREATE DATABASE IF NOT EXISTS intermedio_viajes_turismo;
USE intermedio_viajes_turismo;

-- Limpieza previa de tablas en orden inverso a sus dependencias
DROP TABLE IF EXISTS reservas_018;
DROP TABLE IF EXISTS tours_018;
DROP TABLE IF EXISTS turistas_018;
DROP TABLE IF EXISTS destinos_018;

-- Creación de tablas principales
CREATE TABLE destinos_018 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL CHECK(precio_base > 0)
);

CREATE TABLE turistas_018 (
    pasaporte VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE tours_018 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tour VARCHAR(100) NOT NULL,
    destino_id INT NOT NULL,
    duracion_dias INT NOT NULL CHECK(duracion_dias > 0),
    FOREIGN KEY (destino_id) REFERENCES destinos_018(id)
);

CREATE TABLE reservas_018 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT NOT NULL,
    turista_pasaporte VARCHAR(20) NOT NULL,
    fecha_reserva DATE NOT NULL,
    personas INT NOT NULL DEFAULT 1 CHECK(personas > 0),
    monto_total DECIMAL(10, 2) NOT NULL CHECK(monto_total > 0),
    FOREIGN KEY (tour_id) REFERENCES tours_018(id),
    FOREIGN KEY (turista_pasaporte) REFERENCES turistas_018(pasaporte)
);