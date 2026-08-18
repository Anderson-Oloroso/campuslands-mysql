USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS garaje_motos(
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindraje VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS mantenimientos_motos(
    mantenimiento_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    tipo_servicio VARCHAR(100) NOT NULL,
    costo VARCHAR(50) NOT NULL,
    tecnico DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_mantenimientos_motos_garaje_motos FOREIGN KEY (moto_id) REFERENCES garaje_motos(moto_id) ON DELETE CASCADE
);
