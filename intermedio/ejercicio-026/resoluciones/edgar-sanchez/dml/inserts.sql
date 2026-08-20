-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO clases_personaje (nombre_clase, rol_principal, bonificador_atributos) VALUES
('Guerrero', 'Tanque', '+15% Fuerza, +20% Vitalidad'),
('Mago de Fuego', 'DPS Mágico', '+25% Inteligencia, +10% Mana'),
('Clérigo', 'Sanador', '+20% Sabiduría, +15% Vitalidad'),
('Cazador', 'DPS Físico', '+20% Agilidad, +10% Destreza');

INSERT INTO jugadores_rpg (username, correo, nivel_cuenta, fecha_registro) VALUES
('ShadowSlayer', 'shadow.slayer@game.com', 45, '2026-01-10'),
('ArcaneMaster', 'arcane.master@game.com', 80, '2026-02-01'),
('AegisGuardian', 'aegis.guardian@game.com', 25, '2026-03-15');

INSERT INTO personajes_rpg (jugador_id, clase_id, nombre_personaje, nivel, puntos_vida_max, puntos_mana_max, oro_acumulado) VALUES
(1, 1, 'Thorin', 50, 4500, 300, 15400.50),
(1, 4, 'Hawkeye', 35, 2200, 450, 8200.00),
(2, 2, 'Ignis', 80, 2800, 6500, 95000.75),
(3, 3, 'Valerius', 20, 1800, 1200, 3100.00);

INSERT INTO equipamiento_personaje (personaje_id, nombre_item, tipo_slot, raridad, nivel_requerido, ataque_base, defensa_base) VALUES
(1, 'Hacha del Berserker', 'Arma Principal', 'Épico', 45, 350, 0),
(1, 'Peto de Placas Runificadas', 'Armadura', 'Legendario', 50, 0, 420),
(3, 'Bastón de la Tormenta Solar', 'Arma Principal', 'Mítico', 80, 850, 50),
(3, 'Toga de Archimago', 'Armadura', 'Épico', 75, 0, 180),
(4, 'Maza del Alba', 'Arma Principal', 'Raro', 18, 120, 30);
