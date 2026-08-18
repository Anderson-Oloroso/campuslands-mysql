-- Ejercicio 050 - Avanzado - Índices Estudio de Tatuajes
CREATE TABLE `ejercicio-050-adv-tatuajes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(50) NOT NULL,
    diseno VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2) DEFAULT 0,
    artista VARCHAR(50) NOT NULL
);

-- Crear índices
CREATE INDEX `idx_artista` ON `ejercicio-050-adv-tatuajes` (artista);
CREATE INDEX `idx_precio` ON `ejercicio-050-adv-tatuajes` (precio);