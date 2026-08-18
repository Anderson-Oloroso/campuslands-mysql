USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS platillos_urbanos(
    platillo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_platillo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    ingrediente_principal VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE IF NOT EXISTS pedidos_platillos(
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    platillo_id INT NOT NULL,
    numero_mesa VARCHAR(100) NOT NULL,
    cantidad VARCHAR(50) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pedidos_platillos_platillos_urbanos FOREIGN KEY (platillo_id) REFERENCES platillos_urbanos(platillo_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS log_auditoria_platillos_urbanos(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    platillo_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
