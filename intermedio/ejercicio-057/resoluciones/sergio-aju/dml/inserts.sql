USE campuslands_mysql;

-- Inserción de Regiones
INSERT INTO regiones (nombre_region, nivel_dificultad, clima_predominante) VALUES
('Bosque del Susurro', 'Principiante', 'Templado Húmedo'),
('Ruinas de Caelum', 'Intermedio', 'Árido y Ventoso'),
('Volcán de Magma Oscuro', 'Pesadilla', 'Extremo Caluroso'),
('Tundra de Escarcha Infinita', 'Avanzado', 'Glacial'),
('Valle de los Reyes Olvidados', 'Intermedio', 'Niebla Densa');

-- Inserción de Jugadores (Mínimo 8 registros requeridos)
INSERT INTO jugadores (nickname, nivel_explorador, puntos_experiencia, horas_jugadas, monedas_oro, fecha_registro, estado_cuenta) VALUES
('ShadowRunner', 45, 125000, 120.50, 14500.00, '2026-01-10 14:30:00', 'Activa'),
('Valkyrie_Pro', 82, 340000, 280.00, 48900.50, '2026-01-15 09:15:00', 'Activa'),
('Kael_Seeker', 18, 22000, 35.20, 1200.00, '2026-02-01 18:00:00', 'Activa'),
('Astra_Hunter', 64, 210000, 195.80, 23400.75, '2026-02-12 11:45:00', 'Activa'),
('Gryphon_Lover', 30, 68000, 62.00, 4500.00, '2026-03-05 16:20:00', 'Inactiva'),
('Zero_Casual', 8, 4500, 8.50, 350.00, '2026-04-10 20:10:00', 'Activa'),
('Titan_Breaker', 95, 480000, 410.00, 92000.00, '2026-01-02 08:00:00', 'Activa'),
('Nyx_Explorer', 52, 160000, 142.30, 18250.25, '2026-03-20 13:00:00', 'Activa');

-- Inserción de Misiones
INSERT INTO misiones (region_id, titulo, tipo_mision, recompensa_exp, recompensa_oro, tiempo_estimado_min) VALUES
(1, 'El Secreto de las Hojas Antiguas', 'Principal', 1500, 250.00, 20),
(1, 'Caza de Duendes Silvestres', 'Secundaria', 800, 100.00, 15),
(2, 'El Enigma del Templo Perdido', 'Exploración', 3500, 850.00, 45),
(2, 'Avispa de Piedra Asesina', 'Desafío Boss', 8000, 2500.00, 30),
(3, 'El Guardián del Núcleo de Magma', 'Desafío Boss', 15000, 6000.00, 60),
(4, 'Supervivencia en el Glacial', 'Exploración', 5000, 1200.00, 40),
(5, 'La Tumba del Rey Serpiente', 'Principal', 9500, 3200.00, 50);

-- Inserción de Objetos Coleccionables
INSERT INTO objetos_coleccionables (nombre_objeto, categoria, rareza, valor_mercado) VALUES
('Espada de Acero de las Sombras', 'Arma Melee', 'Raro', 1500.00),
('Arco Largo de Viento Divino', 'Arma Distancia', 'Épico', 4800.00),
('Gancho de Agarre Reforzado', 'Herramienta Exploración', 'Común', 600.00),
('Amuleto de la Serpiente de Oro', 'Reliquia', 'Legendario', 12500.00),
('Poción de Curación Mayor', 'Poción', 'Común', 120.00),
('Mandoble de Lava Forjada', 'Arma Melee', 'Legendario', 18000.00);

-- Inserción de Bitácora de Misiones
INSERT INTO bitacora_misiones (jugador_id, mision_id, estado_mision, intentos, tiempo_empleado_min, fecha_completado) VALUES
(1, 1, 'Completada', 1, 18, '2026-02-01 10:00:00'),
(1, 2, 'Completada', 1, 12, '2026-02-02 11:30:00'),
(1, 3, 'Completada', 2, 50, '2026-02-10 15:20:00'),
(2, 4, 'Completada', 1, 25, '2026-02-20 18:40:00'),
(2, 5, 'Completada', 3, 65, '2026-03-01 21:10:00'),
(3, 1, 'Completada', 1, 22, '2026-02-15 14:00:00'),
(3, 3, 'Fallida', 3, 45, NULL),
(4, 3, 'Completada', 1, 40, '2026-02-25 16:00:00'),
(4, 6, 'En Progreso', 1, NULL, NULL),
(7, 5, 'Completada', 1, 48, '2026-01-25 12:00:00'),
(7, 7, 'Completada', 1, 42, '2026-02-28 17:30:00'),
(8, 2, 'Completada', 1, 10, '2026-03-22 09:00:00'),
(8, 3, 'Abandonada', 2, 20, NULL);

-- Inserción de Inventario de Jugadores
INSERT INTO inventario_jugador (jugador_id, objeto_id, cantidad, esta_equipado) VALUES
(1, 1, 1, TRUE),
(1, 3, 1, TRUE),
(1, 5, 5, FALSE),
(2, 2, 1, TRUE),
(2, 4, 1, FALSE),
(4, 1, 1, FALSE),
(7, 6, 1, TRUE),
(7, 4, 2, FALSE);