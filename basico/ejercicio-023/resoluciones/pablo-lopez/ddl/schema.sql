USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_3d;

CREATE TABLE proyectos_arquitectura_3d (
    id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    arquitecto VARCHAR(100) NOT NULL,
    tipo_proyecto VARCHAR(50) NOT NULL,
    software VARCHAR(50) NOT NULL,
    area_m2 DECIMAL(10,2) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,

    CONSTRAINT chk_proyecto_area
        CHECK (area_m2 > 0),

    CONSTRAINT chk_proyecto_presupuesto
        CHECK (presupuesto >= 0),

    CONSTRAINT chk_proyecto_estado
        CHECK (estado IN ('borrador', 'en_revision', 'aprobado', 'finalizado'))
);