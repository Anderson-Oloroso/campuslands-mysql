-- Ejercicio 030 - Avanzado - Optimización Equipo de Streaming
CREATE TABLE `ejercicio-030-adv-streamers` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    plataforma VARCHAR(30) NOT NULL,
    seguidores INT DEFAULT 0,
    horas_stream INT DEFAULT 0
);

-- Índices para optimizar consultas
CREATE INDEX `idx_plataforma` ON `ejercicio-030-adv-streamers` (plataforma);
CREATE INDEX `idx_seguidores` ON `ejercicio-030-adv-streamers` (seguidores);