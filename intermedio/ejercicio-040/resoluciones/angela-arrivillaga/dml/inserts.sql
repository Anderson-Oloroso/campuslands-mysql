use carreras_urbanas_unique_db;

insert into carreras (nombre_carrera, edicion, fecha_evento, distancia_km) values
('Maratón Nocturna Ciudad de Bogotá', 4, '2026-03-20', 21.10),
('Reto Urbano 10K Medellín', 2, '2026-05-12', 10.00),
('Carrera Atlética San Silvestre Cali', 6, '2026-12-31', 15.00),
('Media Maratón del Caribe Barranquilla', 3, '2026-08-15', 21.10);

insert into atletas (nombre_completo, correo_electronico, documento_identidad, telefono, genero) values
('Angela Arrivillaga', 'angela.arrivillaga@campus.com', '1098765432', '3101234567', 'femenino'),
('Iker Dahinten', 'iker.dahinten@campus.com', '1098765433', '3107654321', 'masculino'),
('Allison Vargas', 'allison.vargas@campus.com', '1098765434', '3112345678', 'femenino'),
('Viktor Machine', 'viktor.machine@campus.com', '1098765435', '3123456789', 'masculino'),
('Cleidy Mosquera', 'cleidy.mosquera@campus.com', '1098765436', '3134567890', 'femenino'),
('Evelin Romero', 'evelin.romero@campus.com', '1098765437', '3145678901', 'femenino'),
('Brayan Stiven', 'brayan.stiven@campus.com', '1098765438', '3156789012', 'masculino'),
('Carlos Mendoza', 'carlos.mendoza@campus.com', '1098765439', '3167890123', 'masculino'),
('Sofia Morales', 'sofia.morales@campus.com', '1098765440', '3178901234', 'femenino'),
('Mateo Rodriguez', 'mateo.rodriguez@campus.com', '1098765441', '3189012345', 'masculino');

insert into categorias (nombre_categoria, edad_minima, edad_maxima) values
('Juvenil (18-29 años)', 18, 29),
('Mayores (30-39 años)', 30, 39),
('Master A (40-49 años)', 40, 49),
('Elite Profesional', 18, 45);

-- Inscripciones a las carreras (respetando restricciones UNIQUE: id_carrera + id_atleta y id_carrera + numero_dorsal)
insert into inscripciones (id_carrera, id_atleta, id_categoria, numero_dorsal, fecha_inscripcion, estado_pago) values
(1, 1, 1, 101, '2026-02-01 10:30:00', 'pagado'),
(1, 2, 1, 102, '2026-02-02 11:00:00', 'pagado'),
(1, 3, 1, 103, '2026-02-03 14:20:00', 'cortesia'),
(1, 4, 4, 104, '2026-02-05 09:15:00', 'pagado'),
(2, 1, 1, 201, '2026-04-01 08:00:00', 'pagado'),
(2, 5, 1, 202, '2026-04-02 12:30:00', 'pagado'),
(2, 6, 2, 203, '2026-04-03 15:45:00', 'pagado'),
(3, 7, 4, 301, '2026-10-10 16:00:00', 'pagado'),
(3, 8, 2, 302, '2026-10-11 09:30:00', 'cortesia'),
(4, 9, 1, 401, '2026-07-01 10:00:00', 'pagado');

-- Resultados oficiales (respetando UNIQUE en id_inscripcion)
insert into resultados (id_inscripcion, tiempo_oficial, posicion_general, estado_llegada) values
(1, '01:25:40', 1, 'finalizado'),
(2, '01:30:15', 2, 'finalizado'),
(3, '01:42:10', 5, 'finalizado'),
(4, '01:22:05', 1, 'finalizado'),
(5, '00:41:30', 1, 'finalizado'),
(6, '00:45:20', 3, 'finalizado'),
(7, '00:48:00', 4, 'finalizado'),
(8, '01:02:15', 1, 'finalizado');