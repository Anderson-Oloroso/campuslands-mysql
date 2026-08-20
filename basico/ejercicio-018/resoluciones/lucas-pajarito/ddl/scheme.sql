-- Creación y selección de la Base de Datos
CREATE DATABASE IF NOT EXISTS basico_viajes_turismo;
USE basico_viajes_turismo;

-- Limpieza previa de tablas en orden inverso a sus dependencias
DROP TABLE IF EXISTS reservas_018;
DROP TABLE IF EXISTS tours_018;
DROP TABLE IF EXISTS turistas_018;
DROP TABLE IF EXISTS destinos_018;

-- Creación de tablas demostrando uso de PRIMARY KEY

-- Tabla 1: PRIMARY KEY simple autoincremental
CREATE TABLE destinos_018 (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    precio_base DECIMAL(10, 2) NOT NULL CHECK(precio_base > 0),
    PRIMARY KEY (id)
);

-- Tabla 2: PRIMARY KEY con código personalizado/alfanumérico (Clave natural)
CREATE TABLE turistas_018 (
    pasaporte VARCHAR(20) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (pasaporte)
);

-- Tabla 3: PRIMARY KEY simple asociada a claves foráneas
CREATE TABLE tours_018 (
    id INT AUTO_INCREMENT,
    nombre_tour VARCHAR(100) NOT NULL,
    destino_id INT NOT NULL,
    duracion_dias INT NOT NULL CHECK(duracion_dias > 0),
    PRIMARY KEY (id),
    FOREIGN KEY (destino_id) REFERENCES destinos_018(id)
);

-- Tabla 4: PRIMARY KEY compuesta (Garantiza unicidad entre un turista y un tour en una fecha)
CREATE TABLE reservas_018 (
    tour_id INT NOT NULL,
    turista_pasaporte VARCHAR(20) NOT NULL,
    fecha_reserva DATE NOT NULL,
    personas INT NOT NULL DEFAULT 1 CHECK(personas > 0),
    monto_total DECIMAL(10, 2) NOT NULL CHECK(monto_total > 0),
    PRIMARY KEY (tour_id, turista_pasaporte, fecha_reserva),
    FOREIGN KEY (tour_id) REFERENCES tours_018(id),
    FOREIGN KEY (turista_pasaporte) REFERENCES turistas_018(pasaporte)
);