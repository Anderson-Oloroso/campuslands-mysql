USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS paquetes_turisitcos(
    paquete_id INT AUTO_INCREMENT PRIMARY KEY,
    destino VARCHAR(100) NOT NULL,
    tipo_paquete VARCHAR(50) NOT NULL,
    duracion_dias VARCHAR(100) NOT NULL,
    precio_persona DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS reservas_viajes(
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    paquete_id INT NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    personas VARCHAR(50) NOT NULL,
    estado_reserva DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_reservas_viajes_paquetes_turisitcos FOREIGN KEY (paquete_id) REFERENCES paquetes_turisitcos(paquete_id) ON DELETE CASCADE
);
