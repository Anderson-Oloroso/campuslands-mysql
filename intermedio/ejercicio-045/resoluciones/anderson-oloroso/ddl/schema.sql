USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS videojuegos_biblioteca(
    juego_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_juego VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    precio_alquiler DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS prestamos_videojuegos(
    prestamo_id INT AUTO_INCREMENT PRIMARY KEY,
    juego_id INT NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    dias_prestamo VARCHAR(50) NOT NULL,
    estado_prestamo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_prestamos_videojuegos_videojuegos_biblioteca FOREIGN KEY (juego_id) REFERENCES videojuegos_biblioteca(juego_id) ON DELETE CASCADE
);
