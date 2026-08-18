USE campuslands_mysql;

DROP TABLE IF EXISTS combates;
DROP TABLE IF EXISTS peleadores;

CREATE TABLE peleadores (
    id_peleador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    fecha_registro DATE NOT NULL,
    CONSTRAINT chk_peso_peleador CHECK (peso_kg > 0)
) ENGINE = InnoDB;

CREATE TABLE combates (
    id_combate INT AUTO_INCREMENT PRIMARY KEY,
    id_peleador_a INT NOT NULL,
    id_peleador_b INT NOT NULL,
    fecha_combate DATE NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    estado ENUM('programado', 'en_curso', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'programado',
    resultado VARCHAR(100) NULL,

    CONSTRAINT fk_combate_peleador_a
        FOREIGN KEY (id_peleador_a)
        REFERENCES peleadores(id_peleador),

    CONSTRAINT fk_combate_peleador_b
        FOREIGN KEY (id_peleador_b)
        REFERENCES peleadores(id_peleador),

    CONSTRAINT chk_peleadores_diferentes
        CHECK (id_peleador_a <> id_peleador_b)
) ENGINE = InnoDB;