DROP TABLE IF EXISTS registros_sesiones_juego;
DROP TABLE IF EXISTS bibliotecas_usuarios;
DROP TABLE IF EXISTS videojuegos;
DROP TABLE IF EXISTS desarrolladores_videojuegos;
DROP TABLE IF EXISTS plataformas_juego;

CREATE TABLE plataformas_juego (
    plataforma_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plataforma VARCHAR(50) NOT NULL UNIQUE,
    empresa_creadora VARCHAR(100) NOT NULL
);

CREATE TABLE desarrolladores_videojuegos (
    desarrollador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudio VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL
);

CREATE TABLE videojuegos (
    videojuego_id INT AUTO_INCREMENT PRIMARY KEY,
    desarrollador_id INT NOT NULL,
    titulo_juego VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    anio_lanzamiento INT NOT NULL CONSTRAINT chk_anio_lanzamiento CHECK (anio_lanzamiento BETWEEN 1970 AND 2026),
    precio_base_usd DECIMAL(8,2) NOT NULL CONSTRAINT chk_precio CHECK (precio_base_usd >= 0.00),
    CONSTRAINT fk_videojuegos_desarrolladores 
        FOREIGN KEY (desarrollador_id) REFERENCES desarrolladores_videojuegos(desarrollador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_estudio_titulo 
        UNIQUE (desarrollador_id, titulo_juego)
);

CREATE TABLE bibliotecas_usuarios (
    biblioteca_id INT AUTO_INCREMENT PRIMARY KEY,
    videojuego_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    horas_jugadas DECIMAL(8,2) NOT NULL DEFAULT 0.00 CONSTRAINT chk_horas CHECK (horas_jugadas >= 0.00),
    estado_completado VARCHAR(30) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado_completado CHECK (estado_completado IN ('Pendiente', 'En Progreso', 'Completado', 'Abandonado')),
    fecha_adquisicion DATE NOT NULL,
    CONSTRAINT fk_bu_videojuegos 
        FOREIGN KEY (videojuego_id) REFERENCES videojuegos(videojuego_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_bu_plataformas 
        FOREIGN KEY (plataforma_id) REFERENCES plataformas_juego(plataforma_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_usuario_juego_plataforma 
        UNIQUE (nombre_usuario, videojuego_id, plataforma_id)
);

CREATE TABLE registros_sesiones_juego (
    sesion_id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT NOT NULL,
    duracion_minutos INT NOT NULL CONSTRAINT chk_duracion_sesion CHECK (duracion_minutos > 0),
    logros_desbloqueados INT NOT NULL DEFAULT 0 CONSTRAINT chk_logros CHECK (logros_desbloqueados >= 0),
    fecha_sesion DATETIME NOT NULL,
    CONSTRAINT fk_rsj_bibliotecas 
        FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas_usuarios(biblioteca_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX idx_videojuegos_genero_anio 
    ON videojuegos (genero, anio_lanzamiento);

CREATE INDEX idx_bibliotecas_busqueda_usuario 
    ON bibliotecas_usuarios (nombre_usuario, estado_completado, horas_jugadas);

CREATE INDEX idx_sesiones_biblioteca_fecha 
    ON registros_sesiones_juego (biblioteca_id, fecha_sesion);