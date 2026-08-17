DROP DATABASE IF EXISTS futbol_sala_seguridad_db;
CREATE DATABASE futbol_sala_seguridad_db;
USE futbol_sala_seguridad_db;

-- Tabla principal de partidos de fútbol sala
CREATE TABLE partidos_sala (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local VARCHAR(50) NOT NULL,
    equipo_visitante VARCHAR(50) NOT NULL,
    goles_local INT NOT NULL,
    goles_visitante INT NOT NULL,
    fecha_partido DATE NOT NULL,
    estado_partido VARCHAR(20) NOT NULL,
    CONSTRAINT chk_goles_l CHECK (goles_local >= 0),
    CONSTRAINT chk_goles_v CHECK (goles_visitante >= 0),
    CONSTRAINT chk_estado_sala CHECK (estado_partido IN ('Programado', 'En Juego', 'Finalizado'))
);

-- Creación de Roles de Base de Datos para Control de Acceso
DROP ROLE IF EXISTS 'rol_administrador_sala', 'rol_auditor_sala';
CREATE ROLE 'rol_administrador_sala', 'rol_auditor_sala';

-- Asignación de Privilegios al Rol de Administrador (Control total sobre la tabla)
GRANT ALL PRIVILEGES ON futbol_sala_seguridad_db.partidos_sala TO 'rol_administrador_sala';

-- Asignación de Privilegios al Rol de Auditor (Sólo lectura de reportes y consultas)
GRANT SELECT ON futbol_sala_seguridad_db.partidos_sala TO 'rol_auditor_sala';

FLUSH PRIVILEGES;
