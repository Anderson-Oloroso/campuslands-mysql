
-- Insercion de datos para futbol sala (ejercicio-008)
USE campuslands_mysql;

INSERT INTO jugadores_futsal (nombre, posicion, id_equipo, goles, tarjetas_amarillas, tarjetas_rojas, valoracion) VALUES
('Pito Gomes', 'Pivot', 3, 28, 2, 0, 9.40),
('Ferrao Rosa', 'Pivot', 3, 24, 1, 0, 9.10),
('Dyego Zuffo', 'Ala', 3, 18, 3, 0, 8.80),
('Sergio Lozano', 'Ala', 3, 14, 4, 1, 8.50),
('Didac Plana', 'Portero', 3, 1, 1, 0, 8.90),
('Taynan da Silva', 'Ala', 2, 19, 5, 0, 8.70),
('Felipe Valerio', 'Cierre', 2, 10, 4, 0, 8.30),
('Jesus Herrero', 'Portero', 1, 0, 0, 0, 8.60),
('Cecilio Morales', 'Ala', 1, 15, 3, 0, 8.40),
('Moslem Oladghobad', 'Ala', 4, 17, 2, 0, 8.95),
('Chino Martinez', 'Ala', 5, 22, 6, 1, 9.00),
('Mati Rosa', 'Pivot', 5, 16, 2, 0, 8.60);
=======
USE campuslands_mysql;

INSERT INTO jugadores_futbol_sala
(
    nombre,
    equipo,
    posicion,
    edad,
    goles,
    asistencias,
    salario,
    estado
)
VALUES
('Juan Pérez','Tigres FS','Pivot',24,18,9,4500.00,'Activo'),
('Carlos Méndez','Leones FS','Ala',26,14,12,4200.00,'Activo'),
('Luis Ramírez','Halcones FS','Portero',29,0,4,3900.00,'Activo'),
('Mario López','Titanes FS','Defensa',28,3,8,3700.00,'Activo'),
('Andrés Castillo','Guerreros FS','Pivot',22,20,6,4800.00,'Lesionado'),
('Kevin García','Águilas FS','Ala',23,15,10,4300.00,'Activo'),
('José Morales','Panteras FS','Defensa',27,4,5,3600.00,'Suspendido'),
('Miguel Díaz','Lobos FS','Pivot',21,12,7,4100.00,'Activo'),
('Fernando Ruiz','Dragones FS','Ala',25,11,13,4250.00,'Activo'),
('Ricardo Soto','Centauros FS','Portero',30,0,2,4000.00,'Activo');
