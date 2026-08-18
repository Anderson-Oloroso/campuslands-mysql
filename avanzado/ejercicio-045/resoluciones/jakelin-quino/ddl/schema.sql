-- Ejercicio 045 - Avanzado - Optimización Biblioteca Gamer
CREATE TABLE `ejercicio-045-adv-juegos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(30) DEFAULT 'acción',
    año INT DEFAULT 2025,
    precio DECIMAL(10,2) DEFAULT 0,
    ventas INT DEFAULT 0
);

-- Índices para optimizar consultas
CREATE INDEX `idx_genero` ON `ejercicio-045-adv-juegos` (genero);
CREATE INDEX `idx_año` ON `ejercicio-045-adv-juegos` (año);
CREATE INDEX `idx_precio` ON `ejercicio-045-adv-juegos` (precio);