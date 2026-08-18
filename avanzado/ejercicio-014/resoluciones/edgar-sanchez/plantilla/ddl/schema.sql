DROP TABLE IF EXISTS bitacora_eventos_saga;
DROP TABLE IF EXISTS recursos_estacion;
DROP TABLE IF EXISTS misiones_espaciales;
DROP TABLE IF EXISTS naves_espaciales;
DROP TABLE IF EXISTS facciones_saga;

CREATE TABLE facciones_saga (
    faccion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_faccion VARCHAR(100) NOT NULL UNIQUE,
    planeta_origen VARCHAR(50) NOT NULL,
    nivel_tecnologico INT NOT NULL CONSTRAINT chk_nivel_tec CHECK (nivel_tecnologico BETWEEN 1 AND 10)
);

CREATE TABLE naves_espaciales (
    nave_id INT AUTO_INCREMENT PRIMARY KEY,
    faccion_id INT NOT NULL,
    codigo_nave VARCHAR(30) NOT NULL UNIQUE,
    nombre_nave VARCHAR(100) NOT NULL,
    clase VARCHAR(50) NOT NULL,
    capacidad_carga_ton DECIMAL(10,2) NOT NULL CONSTRAINT chk_carga CHECK (capacidad_carga_ton >= 0.00),
    estado_nave VARCHAR(30) NOT NULL DEFAULT 'Operativa' CONSTRAINT chk_estado_nave CHECK (estado_nave IN ('Operativa', 'En Mantenimiento', 'En Misión', 'Destruida')),
    CONSTRAINT fk_naves_facciones 
        FOREIGN KEY (faccion_id) REFERENCES facciones_saga(faccion_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE misiones_espaciales (
    mision_id INT AUTO_INCREMENT PRIMARY KEY,
    nave_id INT NOT NULL,
    nombre_mision VARCHAR(100) NOT NULL UNIQUE,
    sistema_estelar VARCHAR(50) NOT NULL,
    prioridad VARCHAR(20) NOT NULL DEFAULT 'Media' CONSTRAINT chk_prioridad CHECK (prioridad IN ('Baja', 'Media', 'Alta', 'Crítica')),
    duracion_estimada_horas INT NOT NULL CONSTRAINT chk_duracion_mision CHECK (duracion_estimada_horas > 0),
    estado_mision VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CONSTRAINT chk_estado_mision CHECK (estado_mision IN ('Pendiente', 'En Curso', 'Completada', 'Fallida')),
    fecha_inicio DATETIME NOT NULL,
    CONSTRAINT fk_misiones_naves 
        FOREIGN KEY (nave_id) REFERENCES naves_espaciales(nave_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE recursos_estacion (
    recurso_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_recurso VARCHAR(50) NOT NULL UNIQUE,
    cantidad_disponible DECIMAL(12,2) NOT NULL CONSTRAINT chk_cantidad CHECK (cantidad_disponible >= 0.00),
    tasa_consumo_diaria DECIMAL(10,2) NOT NULL CONSTRAINT chk_tasa CHECK (tasa_consumo_diaria >= 0.00),
    ultima_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bitacora_eventos_saga (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(100) NOT NULL,
    descripcion_ejecucion TEXT NOT NULL,
    registros_afectados INT NOT NULL DEFAULT 0,
    fecha_ejecucion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);