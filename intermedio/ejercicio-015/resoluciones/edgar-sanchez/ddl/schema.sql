CREATE TABLE plataformas_gamer (
    plataforma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
    fabricante_empresa VARCHAR(50) NOT NULL,
    generacion_consola INT NOT NULL CONSTRAINT chk_generacion CHECK (generacion_consola > 0)
);

CREATE TABLE desarrolladores_gamer (
    desarrollador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    anio_fundacion INT NOT NULL CONSTRAINT chk_fundacion CHECK (anio_fundacion BETWEEN 1950 AND 2026)
);

CREATE TABLE videojuegos_gamer (
    videojuego_id INT AUTO_INCREMENT PRIMARY KEY,
    desarrollador_id INT NOT NULL,
    titulo_juego VARCHAR(150) NOT NULL,
    genero_principal VARCHAR(50) NOT NULL,
    anio_lanzamiento INT NOT NULL CONSTRAINT chk_lanzamiento CHECK (anio_lanzamiento BETWEEN 1970 AND 2026),
    clasificacion_esrb VARCHAR(10) NOT NULL CONSTRAINT chk_esrb CHECK (clasificacion_esrb IN ('E', 'E10+', 'T', 'M', 'AO', 'RP')),
    CONSTRAINT fk_videojuegos_desarrolladores 
        FOREIGN KEY (desarrollador_id) REFERENCES desarrolladores_gamer(desarrollador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_estudio_titulo 
        UNIQUE (desarrollador_id, titulo_juego)
);

CREATE TABLE biblioteca_gamer (
    biblioteca_id INT AUTO_INCREMENT PRIMARY KEY,
    videojuego_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    modalidad_adquisicion VARCHAR(30) NOT NULL CONSTRAINT chk_modalidad CHECK (modalidad_adquisicion IN ('Digital', 'Físico', 'Suscripción')),
    precio_compra_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio_compra CHECK (precio_compra_usd >= 0.00),
    horas_jugadas DECIMAL(6,1) NOT NULL DEFAULT 0.0 CONSTRAINT chk_horas CHECK (horas_jugadas >= 0.0),
    estado_juego VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado CHECK (estado_juego IN ('Pendiente', 'Jugando', 'Completado', 'Abandonado')),
    fecha_adquisicion DATE NOT NULL,
    CONSTRAINT fk_biblioteca_videojuegos 
        FOREIGN KEY (videojuego_id) REFERENCES videojuegos_gamer(videojuego_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_biblioteca_plataformas 
        FOREIGN KEY (plataforma_id) REFERENCES plataformas_gamer(plataforma_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_juego_plataforma 
        UNIQUE (videojuego_id, plataforma_id)
);