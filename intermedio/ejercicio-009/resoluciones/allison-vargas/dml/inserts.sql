-- DML: Registro de dojos y practicantes con claves foráneas asignadas
USE campuslands_mysql;

INSERT INTO dojos_kickboxing (nombre_dojo, entrenador_principal, ciudad, capacidad_maxima) VALUES
('Dojo Cobra Kickboxing', 'Sensei Mario Estrada', 'Guatemala', 40),
('Academia Dragon Strike', 'Sensei Roberto Gómez', 'Quetzaltenango', 30),
('Dojo Titanium Combat', 'Sensei Lucrecia Morales', 'Guatemala', 50),
('Academia Valientes GT', 'Sensei Fernando Paiz', 'Escuintla', 25);

INSERT INTO practicantes_kickboxing (dojo_id, nombre_practicante, cinta, cuota_mensual, estado, fecha_ingreso) VALUES
(1, 'Esteban Salazar', 'Negra', 350.00, 'activo', '2025-01-15'),
(1, 'Daniela Fuentes', 'Azul', 300.00, 'activo', '2025-06-10'),
(2, 'Rodrigo Méndez', 'Marrón', 320.00, 'activo', '2025-03-20'),
(2, 'Sofía Monterroso', 'Blanca', 250.00, 'activo', '2026-02-01'),
(3, 'Gabriel Arriola', 'Verde', 280.00, 'activo', '2025-09-12'),
(3, 'Mariana Ortiz', 'Blanca', 250.00, 'inactivo', '2026-01-18'),
(4, 'Kevin Batres', 'Amarilla', 270.00, 'activo', '2025-11-05'),
(4, 'Carlos Valladares', 'Roja', 330.00, 'suspendido', '2025-04-14');
