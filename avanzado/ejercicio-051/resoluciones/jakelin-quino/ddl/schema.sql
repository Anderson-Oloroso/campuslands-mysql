-- Ejercicio 051 - Avanzado - EXPLAIN Dibujo Digital
CREATE TABLE `ejercicio-051-adv-dibujos` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    artista VARCHAR(50) NOT NULL,
    tecnica VARCHAR(30) DEFAULT 'digital',
    precio DECIMAL(8,2) DEFAULT 0
);

CREATE INDEX `idx_artista` ON `ejercicio-051-adv-dibujos` (artista);
CREATE INDEX `idx_precio` ON `ejercicio-051-adv-dibujos` (precio);