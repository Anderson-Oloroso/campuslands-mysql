USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS autos_hiperdeportivos(
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    caballos_fuerza VARCHAR(100) NOT NULL,
    precio_usd DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
