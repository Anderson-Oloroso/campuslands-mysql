USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, apellido, email, telefono) VALUES
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', '+502 5555-0101'),
('Valeria', 'Silva', 'valeria.silva@email.com', '+502 5555-0102'),
('Diego', 'Arriola', 'diego.arriola@email.com', '+502 5555-0103'),
('Sofía', 'Ramírez', 'sofia.ramirez@email.com', '+502 5555-0104'),
('Kenia', 'Rosales', 'kenia.rosales@email.com', '+502 5555-0105');

-- Inserción de Tatuadores
INSERT INTO tatuadores (nombre, apellido, especialidad, tarifa_hora, experiencia_anios) VALUES
('Mateo', 'Vargas', 'Blackwork & Geométrico', 120.00, 8),
('Elena', 'Navarro', 'Realismo & Chicano', 150.00, 10),
('Adrián', 'López', 'Neotradicional & Color', 100.00, 5),
('Lucía', 'Gómez', 'Minimalista & Fine Line', 90.00, 3); -- Tatuador sin citas aún

-- Inserción de Estilos de Tatuaje
INSERT INTO estilos_tatuaje (nombre_estilo, descripcion) VALUES
('Blackwork', 'Uso intensivo de tinta negra, sombras pesadas y patrones geométricos'),
('Realismo', 'Reproducción fiel de fotografías, retratos y figuras tridimensionales'),
('Neotradicional', 'Líneas gruesas, paletas de color variadas e ilustración detallada'),
('Fine Line', 'Trazos ultrafinos, diseños minimalistas y delicados'),
('Traditional / Old School', 'Símbolos clásicos con contornos negros marcados y colores primarios'); -- Estilo sin sesiones registradas

-- Inserción de Citas / Sesiones de Tatuajes
INSERT INTO citas_tatuajes (cliente_id, tatuador_id, estilo_id, fecha_cita, duracion_horas, costo_total, estado) VALUES
(1, 1, 1, '2026-01-10 10:00:00', 3.5, 420.00, 'Finalizada'),
(2, 2, 2, '2026-01-15 14:00:00', 5.0, 750.00, 'Finalizada'),
(3, 3, 3, '2026-02-01 11:30:00', 2.0, 200.00, 'Finalizada'),
(1, 2, 2, '2026-02-18 09:00:00', 4.0, 600.00, 'Finalizada'),
(4, 1, 1, '2026-03-05 15:00:00', 3.0, 360.00, 'Finalizada'),
(5, 3, 4, '2026-03-20 12:00:00', 1.5, 135.00, 'Finalizada'),
(2, 1, 1, '2026-04-10 10:30:00', 4.5, 540.00, 'Finalizada'),
(3, 2, 2, '2026-04-22 13:00:00', 6.0, 900.00, 'Finalizada'),
(4, 3, 3, '2026-05-02 11:00:00', 2.5, 250.00, 'Cancelada');