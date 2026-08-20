USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS platillos_urbanos(
    platillo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_platillo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    ingrediente_principal VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
