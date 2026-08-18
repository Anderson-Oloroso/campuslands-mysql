-- Ejercicio 032 - Avanzado - Procedimientos Battle Royale
CREATE TABLE `ejercicio-032-adv-jugadores` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nick VARCHAR(30) NOT NULL,
    nivel INT DEFAULT 1,
    puntaje DECIMAL(10,2) DEFAULT 0,
    victorias INT DEFAULT 0,
    partidas INT DEFAULT 0
);