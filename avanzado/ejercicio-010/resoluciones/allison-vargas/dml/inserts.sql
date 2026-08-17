-- DML: Registros completos de pilotos, vehículos y tiempos de circuito
USE campuslands_mysql;

INSERT INTO pilotos_carreras (nombre_piloto, apodo, patrocinador, licencia_pista, estado) VALUES
('Alejandro Silva', 'Nitro', 'Red Bull Racing', 'LIC-URB-101', 'activo'),
('Valeria Morales', 'Víbora', 'Monster Energy', 'LIC-URB-102', 'activo'),
('Diego Fernández', 'Fantasma', 'Sparco GT', 'LIC-URB-103', 'activo'),
('Ricardo Ramos', 'Trueno', 'Pirelli Tires', 'LIC-URB-104', 'activo'),
('Esteban Mendoza', 'Calamar', 'Brembo Brakes', 'LIC-URB-105', 'sancionado'),
('Camila Gutiérrez', 'Furia', 'Nos Energy', 'LIC-URB-106', 'activo'),
('Javier Ortiz', 'Sombra', 'Mobil 1', 'LIC-URB-107', 'activo'),
('Mateo Salazar', 'Asfalto', 'Castrol Edge', 'LIC-URB-108', 'activo');

INSERT INTO vehiculos_carreras (piloto_id, modelo, marca, caballos_fuerza, categoria) VALUES
(1, 'Skyline GT-R R34', 'Nissan', 550, 'Pro Modified'),
(2, 'RX-7 FD', 'Mazda', 480, 'Drift'),
(3, 'Civic Type R', 'Honda', 380, 'Street'),
(4, 'Supra MK4', 'Toyota', 620, 'Pro Modified'),
(5, 'Lancer Evolution IX', 'Mitsubishi', 500, 'Street'),
(6, 'Mustang GT', 'Ford', 460, 'Supercar'),
(7, 'Subaru WRX STI', 'Subaru', 420, 'Street'),
(8, 'Porsche 911 GT3', 'Porsche', 510, 'Supercar');

INSERT INTO resultados_carreras (vehiculo_id, circuito, tiempo_segundos, posicion_final, puntos_obtenidos, fecha_carrera) VALUES
(1, 'Circuito Nocturno Z-4', 78.450, 1, 25, '2026-06-10 22:00:00'),
(2, 'Circuito Nocturno Z-4', 80.120, 2, 18, '2026-06-10 22:00:00'),
(4, 'Circuito Nocturno Z-4', 81.300, 3, 15, '2026-06-10 22:00:00'),
(3, 'Túnel Central Drag', 45.210, 1, 25, '2026-06-18 23:30:00'),
(5, 'Túnel Central Drag', 46.890, 2, 18, '2026-06-18 23:30:00'),
(8, 'Autopista Sur GT', 112.500, 1, 25, '2026-07-02 21:15:00'),
(6, 'Autopista Sur GT', 115.800, 2, 18, '2026-07-02 21:15:00'),
(7, 'Autopista Sur GT', 118.400, 3, 15, '2026-07-02 21:15:00');
