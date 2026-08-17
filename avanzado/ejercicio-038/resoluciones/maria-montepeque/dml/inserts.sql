-- Datos de practica: plantilla de jugadores de un equipo de futbol sala.
-- Este archivo SI puede ejecutarse con el usuario 'campus' normal:
-- solo inserta datos, no crea roles ni usuarios.
USE campuslands_mysql;

INSERT INTO jugadores_roles_avanzado (nombre, equipo, posicion, goles, precio_ficha, estado) VALUES
('Mateo Rivas', 'Halcones FC', 'pivote', 9, 8000.00, 'activo'),
('Santi Belmonte', 'Halcones FC', 'ala', 4, 5000.00, 'activo'),
('Diego Palma', 'Pumas Salon', 'pivote', 7, 7200.00, 'lesionado'),
('Ruben Casal', 'Pumas Salon', 'cierre', 1, 3500.00, 'activo'),
('Nico Farias', 'Rayo Interior', 'ala', 6, 6000.00, 'activo'),
('Andres Roble', 'Rayo Interior', 'cierre', 2, 3800.00, 'activo'),
('Camilo Duarte', 'Titanes de Sala', 'portero', 0, 4200.00, 'activo'),
('Julian Mesa', 'Titanes de Sala', 'ala', 3, 4500.00, 'suspendido');
