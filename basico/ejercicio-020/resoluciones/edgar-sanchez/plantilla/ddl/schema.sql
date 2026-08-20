CREATE TABLE artistas_tatuajes (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(100) NOT NULL UNIQUE,
    especialidad_estilo VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    es_activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE clientes_tatuajes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    documento_identidad VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE citas_tatuaje (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    cliente_id INT NOT NULL,
    estilo_diseño VARCHAR(50) NOT NULL,
    zona_cuerpo VARCHAR(50) NOT NULL,
    tamano_cm DECIMAL(5,2) NOT NULL CHECK (tamano_cm > 0.00),
    costo_estimado_usd DECIMAL(8,2) NOT NULL CHECK (costo_estimado_usd > 0.00),
    fecha_hora_cita DATETIME NOT NULL,
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Agendada' CHECK (estado_cita IN ('Agendada', 'Completada', 'Cancelada')),
    CONSTRAINT fk_citas_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_tatuajes(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_citas_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_tatuajes(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);