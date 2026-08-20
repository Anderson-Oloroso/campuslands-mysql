USE ejercicio_14_int;

INSERT INTO peliculas (titulo,episodio,anio_estreno,duracion_minutos) VALUES
('El Despertar de la Galaxia', 1, 2018, 128),
('La Guerra de los Clones', 2, 2020, 141),
('El Regreso del Imperio', 3, 2022, 136),
('La Amenaza Oscura', 4, 2023, 130),
('Guardianes de Andrómeda', 5, 2024, 145),
('El Último Comandante', 6, 2025, 152);

INSERT INTO personajes (nombre, especie, rol) VALUES
('Kael Orion', 'Humano', 'Comandante'),
('Lira Voss', 'Humano', 'Piloto'),
('Drax Noren', 'Kryon', 'Guerrero'),
('Zara Nex', 'Humano', 'Exploradora'),
('Orin Valek', 'Aureano', 'Científico'),
('Tarek Sol', 'Humano', 'General'),
('Mira Kess', 'Nexari', 'Diplomática'),
('Rho Kane', 'Humano', 'Ingeniero');

INSERT INTO planetas (nombre,sistema, poblacion) VALUES
('Aurelia', 'Sistema Orion', 850000000),
('Kryos', 'Sistema Helix', 120000000),
('Nexara', 'Sistema Vega', 450000000),
('Valen Prime', 'Sistema Orion', 2100000000),
('Drakon', 'Sistema Draco', 78000000),
('Elysium', 'Sistema Vega', 630000000);

INSERT INTO pelicula_personajes (id_pelicula,id_personaje) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 3),
(2, 6),
(3, 1),
(3, 4),
(3, 6),
(4, 2),
(4, 5),
(5, 3),
(5, 7),
(5, 8),
(6, 1),
(6, 4),
(6, 8);

INSERT INTO pelicula_planetas (id_pelicula, id_planeta) VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 6),
(5, 3),
(5, 5),
(6, 1),
(6, 4);