USE campuslands_mysql;

-- Inserción de 8 registros de saltos
INSERT INTO saltos_paracaidismo (modalidad, nivel_experiencia, altura_pies, precio, calificacion, estado) VALUES
('Tandem Básico', 'Principiante', 10000, 180.00, 4.80, 'activo'),
('Tandem VIP Fotos y Video', 'Principiante', 13000, 250.00, 4.95, 'activo'),
('Salto Autónomo AFF Nivel 1', 'Principiante', 12000, 310.00, 4.70, 'activo'),
('Salto Relativo en Grupo', 'Intermedio', 14000, 220.00, 4.60, 'activo'),
('Freefly Acrobático', 'Avanzado', 15000, 290.00, 4.85, 'activo'),
('Wingsuit Vuelo con Traje', 'Avanzado', 15000, 350.00, 4.90, 'activo'),
('Salto Nocturno Especial', 'Avanzado', 12000, 280.00, 4.40, 'activo'),
('Tandem Promocional', 'Principiante', 8000, 120.00, 3.90, 'inactivo');

-- Modificaciones para disparar el trigger trg_auditar_cambio_salto
UPDATE saltos_paracaidismo 
SET precio = 195.00 
WHERE id = 1;

UPDATE saltos_paracaidismo 
SET estado = 'activo', precio = 140.00 
WHERE id = 8;

UPDATE saltos_paracaidismo 
SET precio = 330.00 
WHERE id = 6;