USE campuslands_mysql;

-- Inserción de Clases RPG
INSERT INTO clases_rpg (nombre_clase, rol, multiplicador_danio) VALUES
('Guerrero de la Cruzada', 'Tanque', 1.20),
('Mago Arcano', 'DPS Mágico', 2.50),
('Cazador de Sombras', 'DPS Físico', 1.85),
('Clérigo de la Luz', 'Soporte', 0.90),
('Paladín Bendito', 'Híbrido', 1.40);

-- Inserción de Personajes (Probando límites permitidos por CHECK)
INSERT INTO personajes 
(nombre_jugador, clase_id, nivel, puntos_vida_max, puntos_vida_actual, puntos_mana_max, puntos_mana_actual, fuerza, agilidad, inteligencia, probabilidad_critico, oro_acumulado, estado) 
VALUES
('Aron_Kael', 1, 85, 4500, 4200, 500, 350, 240, 95, 40, 12.50, 15400.50, 'Activo'),
('Valeria_Arcane', 2, 92, 1800, 1800, 6200, 5800, 30, 80, 310, 28.00, 48900.00, 'Activo'),
('Shadow_Rogue', 3, 78, 2600, 0, 1200, 0, 85, 290, 65, 45.00, 8300.75, 'Derrotado'),
('Lumina_Healer', 4, 60, 2100, 2100, 3800, 3800, 45, 60, 195, 8.50, 5200.00, 'Activo'),
('Sir_Galahad', 5, 50, 3200, 1500, 2000, 1200, 160, 75, 110, 15.00, 12000.00, 'En Descanso'),
('Ignis_Sorcerer', 2, 12, 450, 450, 1200, 1200, 15, 25, 85, 6.00, 350.00, 'Activo'),
('Thorin_Ironwall', 1, 100, 6800, 6800, 800, 800, 320, 110, 50, 10.00, 95000.00, 'Activo'),
('Nyx_Blade', 3, 45, 1900, 1200, 900, 450, 70, 180, 45, 32.00, 2100.25, 'Activo');

-- Inserción de Equipamiento (Validaciones CHECK de precios y niveles)
INSERT INTO equipamiento (nombre_item, tipo, rareza, nivel_requerido, bono_ataque, bono_defensa, precio_tienda) VALUES
('Espada del Dragón Carmesí', 'Arma', 'Legendario', 80, 450, 50, 25000.00),
('Báculo de Energía Astral', 'Arma', 'Épico', 75, 520, 10, 18500.00),
('Peto de Hierro Metamórfico', 'Armadura', 'Raro', 40, 0, 280, 4200.00),
('Daga de las Sombras Silenciosas', 'Arma', 'Épico', 65, 310, 0, 12800.00),
('Elixir de Vida Suprema', 'Consumible', 'Común', 1, 0, 0, 150.00),
('Anillo del Rey Hechicero', 'Accesorio', 'Mítico', 90, 200, 150, 75000.00);

-- Inserción de Inventario
INSERT INTO inventario_personaje (personaje_id, equipamiento_id, cantidad, esta_equipado) VALUES
(1, 1, 1, TRUE),
(1, 3, 1, TRUE),
(2, 2, 1, TRUE),
(2, 6, 1, TRUE),
(3, 4, 2, FALSE),
(4, 5, 10, FALSE),
(7, 1, 1, FALSE),
(7, 6, 1, TRUE);