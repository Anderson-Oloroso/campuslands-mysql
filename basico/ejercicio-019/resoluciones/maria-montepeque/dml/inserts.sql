-- Datos de practica: registro de saltos de paracaidismo.
-- Se muestran dos formas validas de INSERT en MySQL.
USE campuslands_mysql;

-- Forma 1: INSERT multi-fila con lista de columnas explicita.
INSERT INTO saltos_basico (paracaidista, nivel, tipo_salto, altura_metros, duracion_caida_libre_seg, costo, fecha_salto) VALUES
('Camila Ortiz', 'principiante', 'tandem', 4000, 45, 250.00, '2026-01-05'),
('Julian Vega', 'principiante', 'tandem', 4000, 45, 250.00, '2026-01-12'),
('Sofia Herrera', 'instructor', 'solo', 3000, 30, 50.00, '2026-01-20'),
('Nicolas Prada', 'intermedio', 'formacion', 4500, 60, 300.00, '2026-02-01'),
('Isabella Cruz', 'avanzado', 'estilo_libre', 3500, 50, 280.00, '2026-02-10'),
('Andres Molina', 'principiante', 'tandem', 4000, 45, 250.00, '2026-02-15'),
('Mateo Duarte', 'intermedio', 'solo', 3000, 35, 150.00, '2026-03-01');

-- Forma 2: INSERT ... SET, util para insertar una sola fila columna a columna.
INSERT INTO saltos_basico
SET paracaidista = 'Valentina Rios',
    nivel = 'avanzado',
    tipo_salto = 'formacion',
    altura_metros = 4500,
    duracion_caida_libre_seg = 55,
    costo = 300.00,
    fecha_salto = '2026-03-08';
