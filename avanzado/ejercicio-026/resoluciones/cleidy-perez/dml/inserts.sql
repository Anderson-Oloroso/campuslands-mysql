-- Datos de practica. Puedes cambiarlos o agregar mas filas.
-- Insertar Clases (6 registros)
INSERT INTO clases (nombre, bonificador_fuerza, bonificador_magia) VALUES
('Guerrero', 10, -2),
('Mago', -3, 12),
('Arquero', 5, 2),
('Paladín', 8, 5),
('Asesino', 7, 0),
('Clérigo', 1, 9);

-- Insertar Personajes (6 registros)
INSERT INTO personajes (nombre_jugador, id_clase, nivel, puntos_vida_actual, puntos_vida_max, mana_actual, mana_max, puntos_experiencia) VALUES
('AronTheBrave', 1, 25, 450, 500, 30, 50, 12500),
('SpellMaster', 2, 40, 180, 220, 600, 600, 48000),
('ShadowHunter', 3, 18, 300, 300, 80, 100, 7200),
('HolyGuardian', 4, 30, 620, 620, 200, 250, 21000),
('NightBlade', 5, 12, 190, 210, 40, 60, 3400),
('LightHealer', 6, 50, 400, 400, 750, 750, 95000);

-- Insertar Objetos (6 registros)
INSERT INTO objetos (codigo_objeto, nombre, tipo, nivel_requerido, precio_oro, durabilidad_actual, durabilidad_max) VALUES
('OBJ-WPN-01', 'Espada de Acero Templado', 'Arma', 10, 150, 80, 100),
('OBJ-WPN-02', 'Báculo de Cristal Arcano', 'Arma', 25, 500, 100, 100),
('OBJ-ARM-01', 'Peto de Placas Reales', 'Armadura', 30, 1200, 150, 150),
('OBJ-POT-01', 'Poción de Curación Mayor', 'Poción', 1, 50, 1, 1),
('OBJ-ACC-01', 'Anillo de Regeneración de Maná', 'Accesorio', 15, 300, 50, 50),
('OBJ-ARM-02', 'Túnica de Seda Encantada', 'Armadura', 20, 450, 60, 80);

-- Insertar Ejercicios (6 registros con el Ejercicio 026)
INSERT INTO ejercicios (codigo, titulo, dificultad, tematica, recompensa_exp) VALUES
('EJ-021', 'Diseño de Árboles de Habilidades', 'Intermedio', 'videojuego RPG', 250),
('EJ-022', 'Gestión de Estados de Alteración (Debuffs)', 'Intermedio aplicado', 'videojuego RPG', 350),
('EJ-023', 'Cálculo de Fórmulas de Daño Físico y Mágico', 'Avanzado', 'videojuego RPG', 500),
('EJ-024', 'Balanceo de Tablas de Loot y Drops', 'Avanzado aplicado', 'videojuego RPG', 600),
('EJ-025', 'Sistema de Misiones y Recompensas', 'Intermedio', 'videojuego RPG', 300),
('EJ-026', 'CHECK para videojuego RPG', 'Intermedio aplicado', 'videojuego RPG', 400);

-- Insertar Inventarios (6 registros)
INSERT INTO inventarios (id_personaje, id_objeto, cantidad) VALUES
(1, 1, 1), -- AronTheBrave tiene 1 Espada de Acero Templado
(1, 4, 15), -- AronTheBrave tiene 15 Pociones de Curación
(2, 2, 1), -- SpellMaster tiene 1 Báculo de Cristal
(2, 5, 2), -- SpellMaster tiene 2 Anillos
(4, 3, 1), -- HolyGuardian tiene 1 Peto de Placas
(6, 6, 1); -- LightHealer tiene 1 Túnica de Seda