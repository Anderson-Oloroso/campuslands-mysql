CREATE TABLE sagas_scifi (
    saga_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_saga VARCHAR(100) NOT NULL UNIQUE,
    creador VARCHAR(100) NOT NULL,
    anio_inicio INT NOT NULL CONSTRAINT chk_saga_anio CHECK (anio_inicio BETWEEN 1800 AND 2026)
);

CREATE TABLE planetas_scifi (
    planeta_id INT AUTO_INCREMENT PRIMARY KEY,
    saga_id INT NOT NULL,
    nombre_planeta VARCHAR(100) NOT NULL,
    clima VARCHAR(50) NOT NULL,
    tipo_terreno VARCHAR(50) NOT NULL,
    CONSTRAINT fk_planetas_sagas 
        FOREIGN KEY (saga_id) REFERENCES sagas_scifi(saga_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT uq_saga_planeta 
        UNIQUE (saga_id, nombre_planeta)
);

CREATE TABLE naves_scifi (
    nave_id INT AUTO_INCREMENT PRIMARY KEY,
    saga_id INT NOT NULL,
    nombre_nave VARCHAR(100) NOT NULL,
    modelo_clase VARCHAR(100) NOT NULL,
    capacidad_tripulacion INT NOT NULL CONSTRAINT chk_capacidad CHECK (capacidad_tripulacion >= 1),
    velocidad_maxima_hiperespacio DECIMAL(5,2) NOT NULL CONSTRAINT chk_velocidad CHECK (velocidad_maxima_hiperespacio > 0.00),
    CONSTRAINT fk_naves_sagas 
        FOREIGN KEY (saga_id) REFERENCES sagas_scifi(saga_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE personajes_scifi (
    personaje_id INT AUTO_INCREMENT PRIMARY KEY,
    saga_id INT NOT NULL,
    planeta_origen_id INT NOT NULL,
    nombre_personaje VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    afiliacion_faccion VARCHAR(50) NOT NULL,
    es_sensible_fuerza_psique BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_personajes_sagas 
        FOREIGN KEY (saga_id) REFERENCES sagas_scifi(saga_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_personajes_planetas 
        FOREIGN KEY (planeta_origen_id) REFERENCES planetas_scifi(planeta_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE VIEW vw_resumen_personajes_scifi AS
SELECT 
    p.personaje_id,
    p.nombre_personaje,
    p.especie,
    p.afiliacion_faccion,
    p.es_sensible_fuerza_psique,
    pl.nombre_planeta AS planeta_origen,
    pl.clima AS clima_planeta,
    s.nombre_saga
FROM personajes_scifi p
INNER JOIN planetas_scifi pl ON p.planeta_origen_id = pl.planeta_id
INNER JOIN sagas_scifi s ON p.saga_id = s.saga_id;

CREATE VIEW vw_indicadores_sagas_scifi AS
SELECT 
    s.saga_id,
    s.nombre_saga,
    s.creador,
    COUNT(DISTINCT p.personaje_id) AS total_personajes,
    COUNT(DISTINCT pl.planeta_id) AS total_planetas,
    COUNT(DISTINCT n.nave_id) AS total_naves,
    COALESCE(MAX(n.velocidad_maxima_hiperespacio), 0.00) AS velocidad_maxima_registrada
FROM sagas_scifi s
LEFT JOIN personajes_scifi p ON s.saga_id = p.saga_id
LEFT JOIN planetas_scifi pl ON s.saga_id = pl.saga_id
LEFT JOIN naves_scifi n ON s.saga_id = n.saga_id
GROUP BY s.saga_id, s.nombre_saga, s.creador;