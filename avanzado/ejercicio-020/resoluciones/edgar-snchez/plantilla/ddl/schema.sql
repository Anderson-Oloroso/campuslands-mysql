DROP TABLE IF EXISTS citas_tatuajes;
DROP TABLE IF EXISTS disenos_catalogo;
DROP TABLE IF EXISTS tatuadores;
DROP TABLE IF EXISTS clientes_estudio;

CREATE TABLE clientes_estudio (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    documento_identidad VARCHAR(30) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    alergias_notas VARCHAR(255) NULL
);

CREATE TABLE tatuadores (
    tatuador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tatuador VARCHAR(100) NOT NULL,
    apodo VARCHAR(50) NOT NULL UNIQUE,
    estilo_principal VARCHAR(50) NOT NULL,
    tarifa_por_hora DECIMAL(8,2) NOT NULL CONSTRAINT chk_tarifa CHECK (tarifa_por_hora > 0.00),
    disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE disenos_catalogo (
    diseno_id INT AUTO_INCREMENT PRIMARY KEY,
    tatuador_id INT NOT NULL,
    nombre_diseno VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    tamano_cm INT NOT NULL CONSTRAINT chk_tamano CHECK (tamano_cm > 0),
    precio_estimado DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_est CHECK (precio_estimado > 0.00),
    CONSTRAINT fk_disenos_tatuadores 
        FOREIGN KEY (tatuador_id) REFERENCES tatuadores(tatuador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE citas_tatuajes (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tatuador_id INT NOT NULL,
    diseno_id INT NULL,
    fecha_cita DATETIME NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    duracion_horas INT NOT NULL CONSTRAINT chk_duracion CHECK (duracion_horas > 0),
    costo_total DECIMAL(10,2) NOT NULL CONSTRAINT chk_costo CHECK (costo_total > 0.00),
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Programada' CONSTRAINT chk_estado_cita CHECK (estado_cita IN ('Programada', 'Completada', 'Cancelada', 'En Proceso')),
    CONSTRAINT fk_citas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_estudio(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_citas_tatuadores 
        FOREIGN KEY (tatuador_id) REFERENCES tatuadores(tatuador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_citas_disenos 
        FOREIGN KEY (diseno_id) REFERENCES disenos_catalogo(diseno_id) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX idx_citas_fecha_estado ON citas_tatuajes (fecha_cita, estado_cita);

CREATE INDEX idx_citas_tatuador_fecha ON citas_tatuajes (tatuador_id, fecha_cita);

CREATE INDEX idx_citas_cliente ON citas_tatuajes (cliente_id);

CREATE INDEX idx_disenos_estilo_precio ON disenos_catalogo (estilo, precio_estimado);