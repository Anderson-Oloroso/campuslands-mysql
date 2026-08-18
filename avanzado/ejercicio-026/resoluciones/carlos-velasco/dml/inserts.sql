-- ============================================================
-- Ejercicio 026 - Datos RPG
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Clases
-- ------------------------------------------------------------
INSERT INTO clases (
    nombre,
    rol,
    nivel_dificultad
)
VALUES
    ('Guerrero', 'Tanque', 'bajo'),
    ('Mago', 'DPS magico', 'alto'),
    ('Arquero', 'DPS a distancia', 'medio'),
    ('Paladin', 'Tanque y soporte', 'medio'),
    ('Asesino', 'DPS cuerpo a cuerpo', 'alto'),
    ('Clerigo', 'Soporte', 'medio'),
    ('Druida', 'Soporte y control', 'alto'),
    ('Berserker', 'DPS cuerpo a cuerpo', 'alto');


-- ------------------------------------------------------------
-- Personajes
-- ------------------------------------------------------------
INSERT INTO personajes (
    id_clase,
    nombre,
    nivel,
    experiencia,
    oro,
    estado
)
VALUES
    (1, 'Thoran', 42, 18500, 4200.00, 'activo'),
    (2, 'Elyra', 58, 34200, 7850.00, 'activo'),
    (3, 'Kael', 35, 14200, 3150.00, 'activo'),
    (4, 'Aldric', 61, 39800, 9200.00, 'activo'),
    (5, 'Nyx', 73, 52600, 12400.00, 'activo'),
    (6, 'Seraphine', 48, 23100, 5800.00, 'activo'),
    (7, 'Lunara', 55, 28700, 6700.00, 'activo'),
    (8, 'Grom', 67, 45100, 10300.00, 'activo'),
    (1, 'Borin', 29, 8900, 1750.00, 'activo'),
    (2, 'Mireya', 44, 19700, 4600.00, 'activo'),
    (3, 'Riven', 38, 15600, 3500.00, 'inactivo'),
    (6, 'Elian', 22, 5200, 900.00, 'activo');


-- ------------------------------------------------------------
-- Misiones
-- ------------------------------------------------------------
INSERT INTO misiones (
    nombre,
    dificultad,
    experiencia_recompensa,
    oro_recompensa,
    estado
)
VALUES
    ('Defender la aldea', 'facil', 1000, 300.00, 'disponible'),
    ('Cueva de los lobos', 'media', 1800, 650.00, 'disponible'),
    ('El bosque oscuro', 'dificil', 3200, 1200.00, 'completada'),
    ('Guardian de la torre', 'dificil', 4000, 1600.00, 'completada'),
    ('Rescate del reino', 'epica', 7000, 3000.00, 'completada'),
    ('Ruinas ancestrales', 'dificil', 3500, 1400.00, 'disponible'),
    ('Dragon del norte', 'epica', 10000, 5000.00, 'bloqueada'),
    ('Mercader perdido', 'facil', 1200, 450.00, 'disponible'),
    ('Templo olvidado', 'media', 2200, 850.00, 'completada'),
    ('Arena de campeones', 'epica', 8500, 4200.00, 'disponible');


-- ------------------------------------------------------------
-- Participación en misiones
-- ------------------------------------------------------------
INSERT INTO personajes_misiones (
    id_personaje,
    id_mision,
    fecha_completada,
    resultado
)
VALUES
    (1, 1, '2026-01-05', 'completada'),
    (1, 2, '2026-01-08', 'completada'),
    (1, 3, '2026-01-15', 'completada'),
    (1, 4, '2026-02-01', 'fallida'),

    (2, 3, '2026-01-10', 'completada'),
    (2, 4, '2026-01-18', 'completada'),
    (2, 5, '2026-02-05', 'completada'),
    (2, 9, '2026-02-15', 'completada'),

    (3, 1, '2026-01-12', 'completada'),
    (3, 2, '2026-01-20', 'fallida'),
    (3, 8, '2026-02-02', 'completada'),

    (4, 3, '2026-01-14', 'completada'),
    (4, 4, '2026-01-25', 'completada'),
    (4, 5, '2026-02-12', 'completada'),
    (4, 9, '2026-02-20', 'completada'),

    (5, 3, '2026-01-17', 'completada'),
    (5, 4, '2026-01-28', 'completada'),
    (5, 5, '2026-02-10', 'completada'),
    (5, 10, '2026-03-01', 'completada'),

    (6, 1, '2026-01-09', 'completada'),
    (6, 2, '2026-01-19', 'completada'),
    (6, 9, '2026-02-07', 'completada'),

    (7, 2, '2026-01-11', 'completada'),
    (7, 3, '2026-01-22', 'fallida'),
    (7, 6, '2026-02-08', 'completada'),

    (8, 4, '2026-01-21', 'completada'),
    (8, 5, '2026-02-03', 'completada'),
    (8, 10, '2026-03-05', 'completada'),

    (9, 1, '2026-01-06', 'completada'),
    (9, 8, '2026-01-16', 'completada'),

    (10, 2, '2026-01-13', 'completada'),
    (10, 3, '2026-01-29', 'completada'),

    (11, 1, '2026-01-07', 'fallida'),
    (11, 6, '2026-02-11', 'completada'),

    (12, 1, '2026-01-23', 'completada');