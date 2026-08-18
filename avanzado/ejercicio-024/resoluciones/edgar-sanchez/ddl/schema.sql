DROP TABLE IF EXISTS inspecciones_soldadura;
DROP TABLE IF EXISTS proyectos_soldadura;
DROP TABLE IF EXISTS equipos_soldar;
DROP TABLE IF EXISTS soldadores;

CREATE TABLE soldadores (
    soldador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_soldador VARCHAR(100) NOT NULL,
    certificacion_codigo VARCHAR(50) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL,
    experiencia_anos INT NOT NULL CONSTRAINT chk_exp CHECK (experiencia_anos >= 0)
);

CREATE TABLE equipos_soldar (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_inventario VARCHAR(30) NOT NULL UNIQUE,
    tipo_proceso VARCHAR(50) NOT NULL CONSTRAINT chk_proceso CHECK (tipo_proceso IN ('SMAW', 'GMAW', 'GTAW', 'FCAW')),
    marca_modelo VARCHAR(100) NOT NULL,
    amperaje_maximo INT NOT NULL CONSTRAINT chk_amperaje CHECK (amperaje_maximo > 0),
    estado_equipo VARCHAR(30) NOT NULL DEFAULT 'Disponible' CONSTRAINT chk_estado_equipo CHECK (estado_equipo IN ('Disponible', 'En Uso', 'En Mantenimiento'))
);

CREATE TABLE proyectos_soldadura (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    soldador_id INT NOT NULL,
    equipo_id INT NOT NULL,
    nombre_proyecto VARCHAR(120) NOT NULL,
    tipo_estructura VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    estado_proyecto VARCHAR(30) NOT NULL DEFAULT 'En Progreso' CONSTRAINT chk_estado_proyecto CHECK (estado_proyecto IN ('Planificado', 'En Progreso', 'En Inspección', 'Aprobado', 'Rechazado')),
    CONSTRAINT fk_proyectos_soldadores 
        FOREIGN KEY (soldador_id) REFERENCES soldadores(soldador_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_proyectos_equipos 
        FOREIGN KEY (equipo_id) REFERENCES equipos_soldar(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE inspecciones_soldadura (
    inspeccion_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    tipo_ensayo VARCHAR(50) NOT NULL CONSTRAINT chk_tipo_ensayo CHECK (tipo_ensayo IN ('Visual', 'Ultrasonido', 'Líquidos Penetrantes', 'Radiografía')),
    inspector_responsable VARCHAR(100) NOT NULL,
    resultado VARCHAR(20) NOT NULL CONSTRAINT chk_resultado CHECK (resultado IN ('Aprobado', 'Rechazado', 'Con Observaciones')),
    fecha_inspeccion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inspecciones_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_soldadura(proyecto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);