CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS saltos;

CREATE TABLE saltos (
    id_salto INT AUTO_INCREMENT PRIMARY KEY,
    participante VARCHAR(100) NOT NULL,
    zona_salto VARCHAR(100) NOT NULL,
    nivel_experiencia VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    altura_salto_m INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,

    CONSTRAINT chk_altura_salto
        CHECK (altura_salto_m > 0),

    CONSTRAINT chk_costo_salto
        CHECK (costo >= 0),

    CONSTRAINT chk_nivel_experiencia
        CHECK (
            nivel_experiencia IN (
                'principiante',
                'intermedio',
                'avanzado'
            )
        ),

    CONSTRAINT chk_estado_salto
        CHECK (
            estado IN (
                'programado',
                'realizado',
                'cancelado'
            )
        )
);