INSERT INTO clientes_estudio (nombre_cliente, documento_identidad, telefono, correo, alergias_notas) VALUES
('Rodrigo Morales', 'DPI-29838192-0101', '555112233', 'rodrigo.m@email.com', 'Alergia al látex'),
('Valeria Solares', 'DPI-18273940-0101', '555445566', 'valeria.s@email.com', 'Sin alergias registradas'),
('Diego Alejandro Ruiz', 'DPI-90182736-0101', '555778899', 'diego.ruiz@email.com', 'Piel sensible');

INSERT INTO tatuadores (nombre_tatuador, apodo, estilo_principal, tarifa_por_hora, disponible) VALUES
('Álvaro Castro', 'BlackInk', 'Realismo / Blackwork', 80.00, TRUE),
('Camila Fuentes', 'InkQueen', 'Neotradicional / Ilustrativo', 75.00, TRUE),
('Esteban Méndez', 'NeoDragon', 'Japonés Tradicional (Irezumi)', 90.00, TRUE);

INSERT INTO disenos_catalogo (tatuador_id, nombre_diseno, estilo, tamano_cm, precio_estimado) VALUES
(1, 'Cráneo Hiperrealista', 'Realismo / Blackwork', 20, 240.00),
(1, 'Cuervo con Rosas', 'Realismo / Blackwork', 15, 180.00),
(2, 'Serpiente Flor de Loto', 'Neotradicional / Ilustrativo', 18, 225.00),
(3, 'Carpa Koi en Olas', 'Japonés Tradicional (Irezumi)', 25, 360.00);

INSERT INTO citas_tatuajes (cliente_id, tatuador_id, diseno_id, fecha_cita, zona_cuerpo, duracion_horas, costo_total, estado_cita) VALUES
(1, 1, 1, '2026-08-20 10:00:00', 'Antebrazo Izquierdo', 3, 240.00, 'Programada'),
(2, 2, 3, '2026-08-20 14:30:00', 'Muslo Derecho', 3, 225.00, 'Programada'),
(3, 3, 4, '2026-08-21 11:00:00', 'Espalda Alta', 4, 360.00, 'Programada'),
(1, 1, 2, '2026-08-10 15:00:00', 'Pantorrilla', 2, 160.00, 'Completada');