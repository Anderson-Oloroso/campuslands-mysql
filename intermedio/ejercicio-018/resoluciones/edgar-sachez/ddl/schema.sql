CREATE TABLE paises_turismo (
    pais_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pais VARCHAR(100) NOT NULL UNIQUE,
    continente VARCHAR(50) NOT NULL CONSTRAINT chk_continente CHECK (continente IN ('América', 'Europa', 'Asia', 'África', 'Oceanía')),
    codigo_iso VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE destinos_turismo (
    destino_id INT AUTO_INCREMENT PRIMARY KEY,
    pais_id INT NOT NULL,
    nombre_destino VARCHAR(100) NOT NULL,
    tipo_destino VARCHAR(50) NOT NULL CONSTRAINT chk_tipo_destino CHECK (tipo_destino IN ('Playa', 'Cultura', 'Aventura', 'Naturaleza', 'Ciudad')),
    costo_promedio_diario_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_costo_diario CHECK (costo_promedio_diario_usd > 0.00),
    CONSTRAINT fk_destinos_paises 
        FOREIGN KEY (pais_id) REFERENCES paises_turismo(pais_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_pais_destino 
        UNIQUE (pais_id, nombre_destino)
);

CREATE TABLE clientes_turismo (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nacionalidad VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE reservas_turismo (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    destino_id INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    dias_estancia INT NOT NULL CONSTRAINT chk_dias_estancia CHECK (dias_estancia > 0),
    monto_total_usd DECIMAL(10,2) NOT NULL CONSTRAINT chk_monto_total CHECK (monto_total_usd >= 0.00),
    estado_reserva VARCHAR(20) NOT NULL DEFAULT 'Confirmada' CONSTRAINT chk_estado_reserva CHECK (estado_reserva IN ('Pendiente', 'Confirmada', 'Cancelada', 'Completada')),
    CONSTRAINT fk_reservas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_turismo(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_reservas_destinos 
        FOREIGN KEY (destino_id) REFERENCES destinos_turismo(destino_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);