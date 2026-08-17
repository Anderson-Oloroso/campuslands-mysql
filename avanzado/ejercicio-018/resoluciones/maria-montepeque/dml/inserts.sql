-- Datos de practica: itinerarios de viaje para aplicar funciones SQL
-- de texto, fecha y numericas.
USE campuslands_mysql;

INSERT INTO itinerarios_avanzado (viajero_nombre, viajero_email, destino, fecha_salida, fecha_regreso, precio_base, descuento_pct) VALUES
('Laura Gomez', 'laura.gomez@gmail.com', 'Cartagena', '2026-01-10', '2026-01-14', 850.00, 10.00),
('Carlos Ruiz', 'carlos.ruiz@hotmail.com', 'Santa Marta', '2026-02-01', '2026-02-03', 620.00, 0.00),
('Ana Torres', 'ana.torres@yahoo.com', 'Medellin', '2026-02-15', '2026-02-22', 540.00, 15.00),
('Diego Perez', 'diego.perez@gmail.com', 'Bogota', '2026-03-05', '2026-03-07', 480.00, 5.00),
('Maria Lopez', 'maria.lopez@outlook.com', 'San Andres', '2026-03-20', '2026-03-28', 990.00, 20.00),
('Jorge Silva', 'jorge.silva@gmail.com', 'Guatape', '2026-04-02', '2026-04-05', 320.00, 0.00),
('Paula Ramirez', 'paula.ramirez@hotmail.com', 'Armenia', '2026-04-18', '2026-04-25', 410.00, 12.50),
('Andres Castro', 'andres.castro@yahoo.com', 'Villa de Leyva', '2026-05-01', '2026-05-04', 390.00, 8.00);
