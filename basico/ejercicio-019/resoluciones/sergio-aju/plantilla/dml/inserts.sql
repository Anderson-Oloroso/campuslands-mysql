USE campuslands_mysql;

-- Inserción de 8 registros de saltos de paracaidismo
INSERT INTO saltos_paracaidismo (modalidad, altura_pies, precio, nivel_experiencia, calificacion, estado) VALUES
('Tandem Básico', 10000, 180.00, 'Principiante', 4.80, 'activo'),
('Tandem VIP Fotos y Video', 13000, 250.00, 'Principiante', 4.95, 'activo'),
('Salto Autónomo AFF Nivel 1', 12000, 310.00, 'Principiante', 4.70, 'activo'),
('Salto Relativo en Grupo', 14000, 220.00, 'Intermedio', 4.60, 'activo'),
('Freefly Acrobático', 15000, 290.00, 'Avanzado', 4.85, 'activo'),
('Wingsuit Vuelo con Traje', 15000, 350.00, 'Avanzado', 4.90, 'activo'),
('Salto Nocturno Especial', 12000, 280.00, 'Avanzado', 4.40, 'activo'),
('Tandem Promocional', 8000, 120.00, 'Principiante', 3.90, 'inactivo');