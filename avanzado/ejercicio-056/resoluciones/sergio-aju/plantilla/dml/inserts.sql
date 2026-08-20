USE campuslands_mysql;

-- Inserción de Jugadores (5 registros)
INSERT INTO jugadores (username, email, nivel_cuenta, oro_acumulado, estado) VALUES
('ShadowSlayer', 'shadow@rpg.com', 45, 125000, 'Activo'),
('ArcaneMaster', 'arcane@rpg.com', 50, 230000, 'Activo'),
('Valkyrie99', 'valk@rpg.com', 28, 45000, 'Activo'),
('NoobMaster69', 'noob@rpg.com', 5, 1200, 'Inactivo'),
('DragonBorn', 'dragon@rpg.com', 60, 500000, 'Activo');

-- Inserción de Personajes (8 registros)
INSERT INTO personajes (jugador_id, nombre_personaje, clase, nivel, puntos_experiencia, fuerza, inteligencia, agilidad) VALUES
(1, 'Kaelen Steel', 'Guerrero', 42, 850000, 180, 45, 90),
(1, 'Zephyr', 'Pistolero', 35, 520000, 95, 60, 195),
(2, 'Merlinus', 'Mago', 50, 1500000, 40, 250, 75),
(2, 'Necros', 'Nigromante', 48, 1300000, 50, 230, 80),
(3, 'Freya', 'Paladín', 28, 380000, 140, 90, 85),
(4, 'BobTheKnight', 'Guerrero', 5, 12000, 35, 10, 15),
(5, 'Aurelius', 'Paladín', 60, 2500000, 220, 150, 110),
(5, 'Ignis', 'Mago', 58, 2200000, 45, 260, 90);

-- Inserción de Misiones (8 registros)
INSERT INTO misiones (titulo, dificultad, experiencia_recompensa, oro_recompensa, nivel_requerido) VALUES
('Cacería de Duendes', 'Fácil', 5000, 200, 1),
('El Secreto del Templo Olvidado', 'Normal', 25000, 1500, 15),
('Incursión en la Cueva del Dragón', 'Difícil', 85000, 8000, 30),
('Caída del Rey Nigromante', 'Leyenda', 250000, 30000, 45),
('Defensa del Castillo Real', 'Normal', 30000, 2000, 20),
('Raid: El Despertar del Titán', 'Raid', 500000, 75000, 55),
('Emboscada en el Bosque Sombrío', 'Fácil', 8000, 400, 5),
('La Venganza del Titán de Fuego', 'Raid', 450000, 60000, 50);

-- Inserción de Registro de Misiones (10 registros)
INSERT INTO registro_misiones (personaje_id, mision_id, tiempo_completado_min, estado, fecha_ejecucion) VALUES
(1, 3, 24.50, 'Completada', '2026-07-01 14:30:00'),
(1, 4, 45.00, 'Completada', '2026-07-05 18:00:00'),
(3, 4, 38.20, 'Completada', '2026-07-10 20:15:00'),
(3, 6, 60.00, 'Fallida', '2026-07-12 22:00:00'),
(7, 6, 52.10, 'Completada', '2026-07-15 16:45:00'),
(8, 8, 48.00, 'Completada', '2026-07-18 19:30:00'),
(5, 2, 15.30, 'Completada', '2026-07-20 11:00:00'),
(2, 3, 18.00, 'Completada', '2026-07-22 15:20:00'),
(6, 1, 10.50, 'Completada', '2026-07-25 09:10:00'),
(4, 4, 55.00, 'Fallida', '2026-07-28 21:00:00');