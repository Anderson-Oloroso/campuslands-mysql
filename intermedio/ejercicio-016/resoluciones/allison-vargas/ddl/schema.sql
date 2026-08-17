-- DDL: Estructura relacional para pedidos y clientes con INNER JOIN
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos_urbano_join;
DROP TABLE IF EXISTS clientes_urbano;
DROP TABLE IF EXISTS platillos_urbano;

CREATE TABLE clientes_urbano (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo_cliente ENUM('frecuente', 'nuevo', 'vip') DEFAULT 'nuevo'
) ENGINE=InnoDB;

CREATE TABLE platillos_urbano (
    platillo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('hamburguesa', 'tacos', 'hot_dog', 'acompañamiento', 'bebida') NOT NULL,
    precio DECIMAL(6,2) NOT NULL CHECK (precio > 0.00)
) ENGINE=InnoDB;

CREATE TABLE pedidos_urbano_join (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    platillo_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes_urbano(cliente_id) ON DELETE CASCADE,
    FOREIGN KEY (platillo_id) REFERENCES platillos_urbano(platillo_id) ON DELETE CASCADE
) ENGINE=InnoDB;
