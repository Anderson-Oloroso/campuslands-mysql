-- Insercion de datos para videojuego de accion y aventura (ejercicio-057)
USE campuslands_mysql;

INSERT INTO artefactos_magicos (nombre_artefacto, id_reino, tipo_artefacto, poder_ataque, poder_defensa, durabilidad, es_legendario) VALUES
('Espada Maestra Destructora del Mal', 1, 'Espada Ancestral', 100, 20, 100, 'Si'),
('Escudo Hyliano Inmortal', 1, 'Escudo Divino', 10, 150, 800, 'Si'),
('Arco de Luz Sagrada', 1, 'Arco Legendario', 88, 10, 100, 'Si'),
('Corona del Rey Helado', 2, 'Amuleto Mistico', 15, 65, 100, 'Si'),
('Lanza de Escarcha Invernal', 2, 'Espada Ancestral', 72, 15, 60, 'No'),
('Machacarrocas Goron de Lava', 3, 'Espada Ancestral', 95, 30, 75, 'Si'),
('Tomo de las Llamas Primordiales', 3, 'Tomo de Poder', 85, 10, 100, 'Si'),
('Tridente de Escamas Zora', 4, 'Espada Ancestral', 68, 25, 70, 'Si'),
('Collar de Perlas Abisales', 4, 'Amuleto Mistico', 5, 80, 100, 'No'),
('Cimitarra de la Ira Tormentosa', 5, 'Espada Ancestral', 82, 18, 65, 'Si'),
('Escudo del Sol Radiante', 5, 'Escudo Divino', 8, 110, 250, 'No'),
('Orbe de Vision Ancestral', 1, 'Amuleto Mistico', 0, 50, 100, 'Si');
