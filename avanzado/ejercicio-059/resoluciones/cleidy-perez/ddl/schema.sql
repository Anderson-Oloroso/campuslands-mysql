CREATE DATABASE IF NOT EXISTS marketplace_accesorios;
USE marketplace_accesorios;

-- Activar el programador de eventos globalmente
SET GLOBAL event_scheduler = ON;

-- 1. Tabla Vendedores / Tiendas
CREATE TABLE IF NOT EXISTS tiendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    email_contacto VARCHAR(100) NOT NULL UNIQUE,
    estado ENUM('Activa', 'Inactiva') DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabla Productos (Accesorios)
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tienda INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    categoria ENUM('Relojes', 'Joyería', 'Gafas', 'Bolsos', 'Cinturones') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    precio_oferta DECIMAL(10,2) NULL,
    fin_oferta DATETIME NULL,
    stock INT DEFAULT 0,
    CONSTRAINT fk_productos_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabla Carrito de Compras Abandonados
CREATE TABLE IF NOT EXISTS carrito_compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT DEFAULT 1,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_carrito_producto FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabla de Auditoría / Reporte Diario de Ventas
CREATE TABLE IF NOT EXISTS log_metricas_diarias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_ejecucion DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_ofertas_expiradas INT DEFAULT 0,
    carritos_depurados INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabla Ejercicios Prácticos
CREATE TABLE IF NOT EXISTS ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    dificultad VARCHAR(50) NOT NULL,
    tematica VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;