CREATE DATABASE IF NOT EXISTS carreras_urbanas;
USE carreras_urbanas;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    edad_minima INT NOT NULL,
    edad_maxima INT NOT NULL
);

CREATE TABLE corredores (
    id_corredor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(80) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    genero ENUM('M', 'F', 'Otro') NOT NULL
);

CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_corredor INT,
    id_categoria INT,
    numero_dorsal INT UNIQUE NOT NULL,
    estado_pago ENUM('pendiente', 'pagado', 'cancelado') DEFAULT 'pagado',
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_corredor) REFERENCES corredores(id_corredor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);