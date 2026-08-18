use campuslands_mysql;

insert into carreras_urbanas (codigo_carrera, nombre_evento, distancia_km, fecha_evento) values
('RUN-10K-01', 'maraton nocturna centro historico', 10.00, '2026-09-15'),
('RUN-21K-02', 'media maraton de la ciudad', 21.09, '2026-10-05'),
('RUN-05K-03', 'carrera 5k familiar por la salud', 5.00, '2026-10-20'),
('RUN-42K-04', 'maraton internacional metropolitana', 42.195, '2026-11-12');

insert into corredores (numero_documento, nombre_completo, correo_electronico, genero, anio_nacimiento) values
('1098765432', 'carlos andres gomez', 'carlos.gomez@gmail.com', 'masculino', 1995),
('1012345678', 'maria fernanda lopez', 'maria.lopez@yahoo.com', 'femenino', 1998),
('1023456789', 'esteban rodriguez', 'erodriguez@hotmail.com', 'masculino', 1990),
('1034567890', 'laura sofia martinez', 'laura.martinez@outlook.com', 'femenino', 2001),
('1045678901', 'mateo jimenez', 'mateo.j@gmail.com', 'masculino', 1988),
('1056789012', 'valeria paz', 'valeria.paz@gmail.com', 'femenino', 1997),
('1067890123', 'david santiago torres', 'dtorres@yahoo.com', 'masculino', 1993),
('1078901234', 'daniela morales', 'daniela.morales@gmail.com', 'femenino', 1996);

insert into inscripciones_carrera (carrera_id, corredor_id, numero_dorsal, estado_pago) values
(1, 1, 101, 'pagado'),
(1, 2, 102, 'pagado'),
(1, 3, 103, 'pendiente'),
(2, 2, 201, 'pagado'),
(2, 4, 202, 'cortesia'),
(3, 5, 501, 'pagado'),
(3, 6, 502, 'pendiente'),
(4, 7, 421, 'pagado');