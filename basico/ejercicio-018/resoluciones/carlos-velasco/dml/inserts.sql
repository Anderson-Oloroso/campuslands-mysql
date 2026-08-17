USE campuslands_mysql;

INSERT INTO destinos (
    nombre,
    pais,
    ciudad,
    tipo_destino,
    precio,
    duracion_dias,
    fecha_disponible,
    estado
) VALUES
    ('Caribe Tropical', 'Guatemala', 'Livingston', 'playa', 850.00, 4, '2026-09-05', 'activo'),
    ('Ciudad Colonial', 'Guatemala', 'Antigua Guatemala', 'cultural', 450.00, 3, '2026-08-25', 'activo'),
    ('Aventura Maya', 'Guatemala', 'Flores', 'naturaleza', 720.00, 5, '2026-09-12', 'activo'),
    ('Cumbres de los Andes', 'Perú', 'Cusco', 'montaña', 1450.00, 7, '2026-10-01', 'activo'),
    ('Experiencia Caribeña', 'Colombia', 'Cartagena', 'playa', 1200.00, 5, '2026-09-20', 'activo'),
    ('Ruta Europea', 'España', 'Madrid', 'ciudad', 2100.00, 8, '2026-10-10', 'activo'),
    ('Patagonia Natural', 'Argentina', 'Bariloche', 'naturaleza', 1800.00, 7, '2026-11-05', 'activo'),
    ('Ruta del Café', 'Colombia', 'Medellín', 'cultural', 950.00, 5, '2026-09-28', 'activo'),
    ('Islas del Pacífico', 'México', 'Cancún', 'playa', 1350.00, 6, '2026-10-15', 'activo'),
    ('Aventura Volcánica', 'Costa Rica', 'San José', 'naturaleza', 1100.00, 6, '2026-11-12', 'inactivo');