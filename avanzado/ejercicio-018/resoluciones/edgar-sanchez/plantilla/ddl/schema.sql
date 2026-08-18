DROP TABLE IF EXISTS reservas_tours;
DROP TABLE IF EXISTS tours_disponibles;
DROP TABLE IF EXISTS Guias_turismo;
DROP TABLE IF EXISTS destinos_turisticos;
DROP TABLE IF EXISTS turistas;

CREATE TABLE turistas (
    turista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_turista VARCHAR(100) NOT NULL,
    pasaporte VARCHAR(30) NOT NULL UNIQUE,
    nacionalidad VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE destinos_turisticos (
    destino_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_destino VARCHAR(100) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL CONSTRAINT chk_categoria_destino CHECK (categoria IN ('Cultura', 'Aventura', 'Playa', 'Ecoturismo'))
);

CREATE TABLE guias_turismo (
    guia_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_guia VARCHAR(100) NOT NULL,
    idioma_principal VARCHAR(30) NOT NULL,
    anos_experiencia INT NOT NULL CONSTRAINT chk_experiencia CHECK (anos_experiencia >= 0),
    tarifa_diaria_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_tarifa_guia CHECK (tarifa_diaria_usd > 0.00)
);

CREATE TABLE tours_disponibles (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    destino_id INT NOT NULL,
    guia_id INT NOT NULL,
    codigo_tour VARCHAR(20) NOT NULL UNIQUE,
    nombre_tour VARCHAR(120) NOT NULL,
    duracion_dias INT NOT NULL CONSTRAINT chk_duracion_dias CHECK (duracion_dias > 0),
    precio_base_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_precio_tour CHECK (precio_base_usd > 0.00),
    cupo_maximo INT NOT NULL CONSTRAINT chk_cupo CHECK (cupo_maximo > 0),
    CONSTRAINT fk_tours_destinos 
        FOREIGN KEY (destino_id) REFERENCES destinos_turisticos(destino_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_tours_guias 
        FOREIGN KEY (guia_id) REFERENCES guias_turismo(guia_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE reservas_tours (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT NOT NULL,
    turista_id INT NOT NULL,
    codigo_reserva VARCHAR(20) NOT NULL UNIQUE,
    fecha_reserva DATE NOT NULL,
    fecha_viaje DATE NOT NULL,
    numero_personas INT NOT NULL CONSTRAINT chk_num_personas CHECK (numero_personas > 0),
    monto_total_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_monto_reserva CHECK (monto_total_usd > 0.00),
    estado_reserva VARCHAR(20) NOT NULL DEFAULT 'Confirmada' CONSTRAINT chk_estado_reserva CHECK (estado_reserva IN ('Confirmada', 'Pendiente', 'Cancelada', 'Completada')),
    CONSTRAINT fk_rt_tours 
        FOREIGN KEY (tour_id) REFERENCES tours_disponibles(tour_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_rt_turistas 
        FOREIGN KEY (turista_id) REFERENCES turistas(turista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_fechas_coherentes CHECK (fecha_viaje >= fecha_reserva)
);