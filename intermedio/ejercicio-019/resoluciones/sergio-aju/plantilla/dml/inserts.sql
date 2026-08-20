USE campuslands_mysql;

-- Inserción de 8 registros de saltos para realizar agrupamientos y filtros con HAVING
INSERT INTO saltos_paracaidismo (modalidad, nivel_experiencia, altura_pies, precio, calificacion, zona_salto, estado) VALUES
('Tandem Básico', 'Principiante', 10000, 180.00, 4.80, 'Zona Costa', 'activo'),
('Tandem VIP Fotos y Video', 'Principiante', 13000, 250.00, 4.95, 'Zona Costa', 'activo'),
('Salto Autónomo AFF Nivel 1', 'Principiante', 12000, 310.00, 4.70, 'Zona Valle', 'activo'),
('Salto Relativo en Grupo', 'Intermedio', 14000, 220.00, 4.60, 'Zona Valle', 'activo'),
('Freefly Acrobático', 'Avanzado', 15000, 290.00, 4.85, 'Zona Montaña', 'activo'),
('Wingsuit Vuelo con Traje', 'Avanzado', 15000, 350.00, 4.90, 'Zona Montaña', 'activo'),
('Salto Nocturno Especial', 'Avanzado', 12000, 280.00, 4.40, 'Zona Valle', 'activo'),
('Tandem Promocional', 'Principiante', 8000, 120.00, 3.90, 'Zona Costa', 'inactivo');