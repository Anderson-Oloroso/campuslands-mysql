DROP TABLE IF EXISTS bitacora_auditoria_saltos;
DROP TABLE IF EXISTS saltos_realizados;
DROP TABLE IF EXISTS equipos_paracaidismo;
DROP TABLE IF EXISTS paracaidistas;
DROP TABLE IF EXISTS zonas_salto;

CREATE TABLE zonas_salto (
    zona_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_zona VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(100) NOT NULL,
    altitud_maxima_pies INT NOT NULL CONSTRAINT chk_altitud CHECK (altitud_maxima_pies > 0)
);

CREATE TABLE paracaidistas (
    paracaidista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paracaidista VARCHAR(100) NOT NULL,
    licencia_numero VARCHAR(30) NOT NULL UNIQUE,
    nivel_experiencia VARCHAR(30) NOT NULL CONSTRAINT chk_nivel CHECK (nivel_experiencia IN ('A - Principiante', 'B - Intermedio', 'C - Avanzado', 'D - Maestro')),
    total_saltos_registrados INT NOT NULL DEFAULT 0 CONSTRAINT chk_total_saltos CHECK (total_saltos_registrados >= 0)
);

CREATE TABLE equipos_paracaidismo (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_equipo VARCHAR(30) NOT NULL UNIQUE,
    marca_modelo VARCHAR(100) NOT NULL,
    tipo_paracaidas VARCHAR(50) NOT NULL,
    saltos_acumulados_equipo INT NOT NULL DEFAULT 0 CONSTRAINT chk_saltos_equipo CHECK (saltos_acumulados_equipo >= 0),
    estado_equipo VARCHAR(30) NOT NULL DEFAULT 'Disponible' CONSTRAINT chk_estado_equipo CHECK (estado_equipo IN ('Disponible', 'En Uso', 'En Mantenimiento', 'Retirado'))
);

CREATE TABLE saltos_realizados (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    paracaidista_id INT NOT NULL,
    equipo_id INT NOT NULL,
    zona_id INT NOT NULL,
    codigo_salto VARCHAR(20) NOT NULL UNIQUE,
    fecha_salto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    altitud_salto_pies INT NOT NULL CONSTRAINT chk_altitud_salto CHECK (altitud_salto_pies > 0),
    tiempo_caida_libre_seg INT NOT NULL CONSTRAINT chk_tiempo_caida CHECK (tiempo_caida_libre_seg >= 0),
    modalidad VARCHAR(50) NOT NULL,
    CONSTRAINT fk_saltos_paracaidistas 
        FOREIGN KEY (paracaidista_id) REFERENCES paracaidistas(paracaidista_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_equipos 
        FOREIGN KEY (equipo_id) REFERENCES equipos_paracaidismo(equipo_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_zonas 
        FOREIGN KEY (zona_id) REFERENCES zonas_salto(zona_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE bitacora_auditoria_saltos (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    paracaidista_id INT NOT NULL,
    equipo_id INT NOT NULL,
    accion_realizada VARCHAR(50) NOT NULL,
    detalle_auditoria TEXT NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);