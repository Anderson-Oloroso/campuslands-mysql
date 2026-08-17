-- Datos de practica: saltos de un club de paracaidismo.
-- Se muestran dos formas validas de INSERT en MySQL.
USE campuslands_mysql;

-- Forma 1: INSERT multi-fila con lista de columnas explicita.
INSERT INTO saltos_basico (paracaidista, instructor, tipo_salto, zona_salto, altura_metros, costo, fecha_salto) VALUES
('Mateo Rivas', 'Pedro Ariza', 'tandem', 'La Sabana', 4000, 450000.00, '2026-01-05'),
('Santi Belmonte', 'Sofia Herrera', 'estabilidad', 'Zona Norte', 3500, 380000.00, '2026-01-08'),
('Diego Palma', 'Pedro Ariza', 'formacion', 'La Sabana', 4200, 520000.00, '2026-01-12'),
('Ruben Casal', 'Camila Ortiz', 'precision', 'Zona Sur', 3000, 300000.00, '2026-01-15'),
('Nico Farias', 'Julian Vega', 'free_fly', 'Zona Norte', 4500, 600000.00, '2026-01-20'),
('Andres Roble', 'Sofia Herrera', 'tandem', 'La Sabana', 4000, 450000.00, '2026-02-01'),
('Camilo Duarte', 'Pedro Ariza', 'estabilidad', 'Zona Sur', 3500, 380000.00, '2026-02-05');

-- Forma 2: INSERT ... SET, util para insertar una sola fila columna a columna.
INSERT INTO saltos_basico
SET paracaidista = 'Julian Mesa',
    instructor = 'Camila Ortiz',
    tipo_salto = 'precision',
    zona_salto = 'Zona Sur',
    altura_metros = 3000,
    costo = 320000.00,
    fecha_salto = '2026-02-10';
