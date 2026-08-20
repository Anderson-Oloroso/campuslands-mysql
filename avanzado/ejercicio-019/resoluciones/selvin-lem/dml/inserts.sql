-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO paracaidismo (nombre, categoria, puntaje, estado) VALUES
('Salto Tándem 10,000ft', 'Tándem', 88.50, 'activo'),
('Salto Autónomo Curso AFF', 'Acelerado', 95.00, 'activo'),
('Salto de Exhibición Wingsuit', 'Avanzado', 78.00, 'activo'),
('Salto Nocturno Táctico', 'Especializado', 35.00, 'activo'), -- El trigger cambiará estado a 'revision' por puntaje < 40
('Salto B.A.S.E. Urbano', 'Avanzado', 52.00, 'revision'),
('Formación Relativa 4-Way', 'Deportivo', 82.25, 'activo'),
('Práctica de Emergencia Canopy', 'Seguridad', 25.00, 'inactivo');