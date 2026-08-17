-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE agencia_viajes;

INSERT INTO turistas (nombre, pais_origen) VALUES
('Sofia Lopez', 'Guatemala'),
('John Smith', 'Estados Unidos'),
('Maria Garcia', 'España');

INSERT INTO paquetes_turisticos (destino, precio_por_noche, descuento_porcentaje) VALUES
('Cancún All Inclusive', 150.00, 10.00),
('Tikal y Antigua Guatemala', 120.00, 5.00),
('Punta Cana Resort', 200.00, 15.00);

INSERT INTO reservas (turista_id, paquete_id, fecha_inicio, noches, personas) VALUES
(1, 2, '2026-03-10', 4, 2),
(2, 1, '2026-04-01', 7, 1),
(3, 3, '2026-05-15', 5, 3);
