-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO paises_turismo (nombre_pais, continente, codigo_iso) VALUES
('Guatemala', 'América', 'GTM'),
('Japón', 'Asia', 'JPN'),
('España', 'Europa', 'ESP'),
('Perú', 'América', 'PER');

INSERT INTO destinos_turismo (pais_id, nombre_destino, tipo_destino, costo_promedio_diario_usd) VALUES
(1, 'Antigua Guatemala', 'Cultura', 75.00),
(1, 'Lago de Atitlán', 'Naturaleza', 60.00),
(2, 'Kyoto', 'Cultura', 150.00),
(2, 'Tokio', 'Ciudad', 180.00),
(3, 'Barcelona', 'Ciudad', 140.00),
(4, 'Machu Picchu', 'Aventura', 110.00);

INSERT INTO clientes_turismo (nombre_cliente, correo, nacionalidad, fecha_registro) VALUES
('Ana Lucía Gómez', 'ana.gomez@email.com', 'Guatemalteca', '2026-01-10'),
('Mateo Fernández', 'mateo.f@email.com', 'Mexicana', '2026-02-14'),
('Carla Mendoza', 'carla.mendoza@email.com', 'Española', '2026-03-01'),
('David Ruiz', 'david.ruiz@email.com', 'Estadounidense', '2026-03-15');

INSERT INTO reservas_turismo (cliente_id, destino_id, fecha_reserva, dias_estancia, monto_total_usd, estado_reserva) VALUES
(1, 3, '2026-04-01', 7, 1050.00, 'Completada'),
(1, 4, '2026-05-10', 5, 900.00, 'Completada'),
(2, 1, '2026-06-12', 4, 300.00, 'Completada'),
(2, 2, '2026-07-01', 3, 180.00, 'Confirmada'),
(3, 6, '2026-07-20', 6, 660.00, 'Completada'),
(4, 5, '2026-08-02', 8, 1120.00, 'Confirmada'),
(4, 1, '2026-08-10', 5, 375.00, 'Cancelada');