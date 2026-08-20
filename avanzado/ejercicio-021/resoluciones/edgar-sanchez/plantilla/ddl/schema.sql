DROP TABLE IF EXISTS capas_proyecto;
DROP TABLE IF EXISTS proyectos_dibujo;
DROP TABLE IF EXISTS pinceles_herramientas;
DROP TABLE IF EXISTS artistas_digitales;

CREATE TABLE artistas_digitales (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL,
    alias_artistico VARCHAR(50) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL UNIQUE,
    software_preferido VARCHAR(50) NOT NULL
);

CREATE TABLE pinceles_herramientas (
    pincel_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pincel VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    tamano_base_px INT NOT NULL CONSTRAINT chk_tamano_pincel CHECK (tamano_base_px > 0),
    opacidad_predeterminada DECIMAL(5,2) NOT NULL CONSTRAINT chk_opacidad CHECK (opacidad_predeterminada BETWEEN 0.00 AND 100.00)
);

CREATE TABLE proyectos_dibujo (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT NOT NULL,
    titulo_proyecto VARCHAR(120) NOT NULL,
    ancho_px INT NOT NULL CONSTRAINT chk_ancho CHECK (ancho_px > 0),
    alto_px INT NOT NULL CONSTRAINT chk_alto CHECK (alto_px > 0),
    dpi INT NOT NULL DEFAULT 300 CONSTRAINT chk_dpi CHECK (dpi >= 72),
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_proyecto VARCHAR(30) NOT NULL DEFAULT 'En Proceso' CONSTRAINT chk_estado_proyecto CHECK (estado_proyecto IN ('Borrador', 'En Proceso', 'Terminado', 'Archivado')),
    CONSTRAINT fk_proyectos_artistas 
        FOREIGN KEY (artista_id) REFERENCES artistas_digitales(artista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE capas_proyecto (
    capa_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    pincel_usado_id INT NULL,
    nombre_capa VARCHAR(80) NOT NULL,
    modo_fusion VARCHAR(40) NOT NULL DEFAULT 'Normal',
    orden_jerarquia INT NOT NULL CONSTRAINT chk_orden CHECK (orden_jerarquia >= 1),
    visible BOOLEAN NOT NULL DEFAULT TRUE,
    opacidad_capa DECIMAL(5,2) NOT NULL DEFAULT 100.00 CONSTRAINT chk_opacidad_capa CHECK (opacidad_capa BETWEEN 0.00 AND 100.00),
    CONSTRAINT fk_capas_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_dibujo(proyecto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_capas_pinceles 
        FOREIGN KEY (pincel_usado_id) REFERENCES pinceles_herramientas(pincel_id) 
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT uq_proyecto_capa_orden 
        UNIQUE (proyecto_id, orden_jerarquia)
);

CREATE INDEX idx_proyectos_artista_estado ON proyectos_dibujo (artista_id, estado_proyecto);

CREATE INDEX idx_proyectos_fecha ON proyectos_dibujo (fecha_creacion);

CREATE INDEX idx_capas_proyecto_fusion ON capas_proyecto (proyecto_id, modo_fusion);  