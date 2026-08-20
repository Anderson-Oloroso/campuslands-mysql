CREATE TABLE centros_salto (
    centro_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_centro VARCHAR(100) NOT NULL UNIQUE,
    aeropuerto_base VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE instructores_paracaidismo (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    licencia_uspa VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    total_saltos_acumulados INT NOT NULL CHECK (total_saltos_acumulados >= 500),
    es_activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE clientes_paracaidistas (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    pasaporte_dni VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE saltos_paracaidismo (
    salto_id INT AUTO_INCREMENT PRIMARY KEY,
    centro_id INT NOT NULL,
    instructor_id INT NOT NULL,
    cliente_id INT NOT NULL,
    modalidad VARCHAR(30) NOT NULL CHECK (modalidad IN ('Tándem', 'AFF Solo', 'AFF Acompañado', 'Relativo')),
    altitud_pies INT NOT NULL CHECK (altitud_pies BETWEEN 5000 AND 18000),
    fecha_hora_salto DATETIME NOT NULL,
    precio_usd DECIMAL(8,2) NOT NULL CHECK (precio_usd > 0.00),
    CONSTRAINT fk_saltos_centros 
        FOREIGN KEY (centro_id) REFERENCES centros_salto(centro_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_instructores 
        FOREIGN KEY (instructor_id) REFERENCES instructores_paracaidismo(instructor_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_saltos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_paracaidistas(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);