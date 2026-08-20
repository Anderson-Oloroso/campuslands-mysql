USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS niveles_aventura(
    nivel_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nivel VARCHAR(100) NOT NULL,
    mundo VARCHAR(50) NOT NULL,
    dificultad VARCHAR(100) NOT NULL,
    puntos_recompensa DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(30) NOT NULL DEFAULT 'Activo'
);
