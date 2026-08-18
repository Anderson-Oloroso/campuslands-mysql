USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS autos_hiperdeportivos(
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    caballos_fuerza VARCHAR(100) NOT NULL,
    precio_usd DECIMAL(12,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS pruebas_velocidad(
    prueba_id INT AUTO_INCREMENT PRIMARY KEY,
    auto_id INT NOT NULL,
    pista VARCHAR(100) NOT NULL,
    velocidad_max VARCHAR(50) NOT NULL,
    tiempo_lap DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_pruebas_velocidad_autos_hiperdeportivos FOREIGN KEY (auto_id) REFERENCES autos_hiperdeportivos(auto_id) ON DELETE CASCADE
);
