-- Datos de practica: misiones de un videojuego de accion y aventura.
USE campuslands_mysql;

INSERT INTO misiones_basico (titulo, tipo_mision, dificultad, region, recompensa_oro, experiencia_otorgada, completada) VALUES
('La Caida del Reino', 'principal', 'dificil', 'Valle Sombrio', 500, 1200, TRUE),
('El Ultimo Guardian', 'principal', 'extremo', 'Fortaleza Norte', 800, 2000, FALSE),
('Rescate en el Pantano', 'secundaria', 'normal', 'Pantano Negro', 150, 300, TRUE),
('Caceria de Lobos', 'desafio', 'facil', 'Bosque Antiguo', 80, 150, TRUE),
('Reliquias Perdidas', 'coleccionable', 'facil', 'Ruinas de Kael', 50, 100, FALSE),
('El Mercader Fantasma', 'secundaria', 'dificil', 'Ciudad Portuaria', 220, 400, FALSE),
('Torneo de Arena', 'desafio', 'extremo', 'Coliseo Real', 600, 900, TRUE),
('Mapa del Tesoro', 'coleccionable', 'normal', 'Islas del Sur', 100, 180, FALSE),
('La Traicion del Consejo', 'principal', 'normal', 'Capital Imperial', 350, 700, TRUE);
