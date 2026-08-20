-- Carga inicial de datos de prueba para agencia de viajes
USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, pais_origen, email) VALUES
('Carlos Ruiz', 'Guatemala', 'carlos.ruiz@email.com'),
('Sophia Smith', 'Estados Unidos', 'sophia.s@email.com'),
('Jean Dupont', 'Francia', 'j.dupont@email.com'),
('Mariana Gómez', 'México', 'm.gomez@email.com'),
('Lars Olsson', 'Suecia', 'lars.o@email.com');

-- Inserción de Paquetes Turísticos
INSERT INTO paquetes_turisticos (nombre, destino, categoria, precio_por_noche, es_temporada_alta, estado) VALUES
('Caribe Soñado', 'Cancún', 'Playa', 280.00, 1, 'disponible'),
('Escapada Maya & Selva', 'Tikal', 'Cultural', 95.00, 0, 'disponible'),
('Aventura en los Alpes', 'Chamonix', 'Aventura', 320.00, 1, 'disponible'),
('Ecotour Amazonía', 'Iquitos', 'Ecoturismo', 140.00, 0, 'disponible'),
('Trekking en Atacama', 'San Pedro', 'Aventura', 180.00, 0, 'disponible'),
('Ruta Colonial y Volcanes', 'Antigua Guatemala', 'Cultural', 130.00, 1, 'disponible'),
('Paraíso Santorini', 'Santorini', 'Playa', 350.00, 1, 'disponible'),
('Safari Urbano', 'Nueva York', 'Cultural', 80.00, 0, 'inactivo');

-- Inserción de Reservas
INSERT INTO reservas (cliente_id, paquete_id, fecha_inicio, fecha_fin, numero_personas, estado_reserva) VALUES
(1, 2, '2026-09-01', '2026-09-06', 2, 'confirmada'), -- Tikal: 5 días
(2, 1, '2026-10-10', '2026-10-17', 2, 'confirmada'), -- Cancún: 7 días
(3, 3, '2026-12-20', '2026-12-27', 1, 'confirmada'), -- Chamonix: 7 días
(4, 4, '2026-09-15', '2026-09-20', 3, 'confirmada'), -- Iquitos: 5 días
(5, 6, '2026-11-01', '2026-11-05', 2, 'confirmada'), -- Antigua: 4 días
(1, 5, '2026-12-01', '2026-12-08', 2, 'pendiente'),  -- Atacama: 7 días
(2, 7, '2026-09-10', '2026-09-14', 2, 'cancelada');  -- Santorini