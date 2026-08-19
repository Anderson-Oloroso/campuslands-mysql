USE carreras_urbanas;

INSERT INTO categorias (nombre_categoria, edad_minima, edad_maxima) VALUES
('Juvenil A', 15, 19),
('Libre Elite', 20, 39),
('Master A', 40, 49),
('Master B', 50, 99);

INSERT INTO corredores (nombre_completo, correo, fecha_nacimiento, genero) VALUES
('Carlos Vives', 'carlos.vives@mail.com', '2005-03-12', 'M'),
('Mariana Pajon', 'mariana.pajon@mail.com', '1998-07-20', 'F'),
('Nairo Quintana', 'nairo.quintana@mail.com', '1990-02-04', 'M'),
('Caterine Ibarguen', 'caterine.ibarguen@mail.com', '1984-02-12', 'F'),
('Rigoberto Uran', 'rigo.uran@mail.com', '1987-01-26', 'M'),
('Estefania Gomez', 'estefania.gomez@mail.com', '2007-08-15', 'F'),
('Juan Guillermo', 'juan.guillermo@mail.com', '1975-11-05', 'M'),
('Sofia Vergara', 'sofia.vergara@mail.com', '1980-05-10', 'F');

INSERT INTO inscripciones (id_corredor, id_categoria, numero_dorsal, estado_pago) VALUES
(1, 1, 101, 'pagado'),
(2, 2, 102, 'pagado'),
(3, 2, 103, 'pagado'),
(4, 3, 104, 'pagado'),
(5, 3, 105, 'pendiente'),
(6, 1, 106, 'pagado'),
(7, 4, 107, 'pagado'),
(8, 3, 108, 'cancelado');