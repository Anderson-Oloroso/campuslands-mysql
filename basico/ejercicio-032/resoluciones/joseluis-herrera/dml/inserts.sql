USE campuslands_mysql;

INSERT INTO jugadores (
    nombre,
    nickname,
    edad,
    partidas_jugadas,
    victorias,
    eliminaciones,
    puntaje,
    rango,
    fecha_registro,
    estado
) VALUES
('Carlos Mendoza', 'ShadowCarlos', 21, 150, 42, 380, 2450.50, 'Diamante', '2025-01-15', 'activo'),
('Diego Ramirez', 'RexDiego', 24, 210, 65, 520, 3180.75, 'Maestro', '2024-11-20', 'activo'),
('Luis Torres', 'LuiPro', 19, 95, 21, 210, 1780.25, 'Platino', '2025-03-10', 'activo'),
('Andres Castillo', 'AndroBR', 22, 180, 50, 430, 2765.00, 'Diamante', '2025-02-05', 'activo'),
('Mateo Vargas', 'VargasX', 27, 250, 78, 610, 3520.90, 'Maestro', '2024-09-18', 'activo'),
('Jorge Navarro', 'JorgeStorm', 20, 75, 14, 155, 1325.40, 'Oro', '2025-04-22', 'activo'),
('Daniel Herrera', 'DaniBattle', 23, 130, 35, 295, 2210.60, 'Platino', '2025-01-30', 'activo'),
('Kevin Morales', 'KevGaming', 18, 60, 9, 120, 980.15, 'Plata', '2025-05-12', 'inactivo');