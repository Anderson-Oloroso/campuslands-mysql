
USE campuslands_mysql;

INSERT INTO peleadores_kb (nombre, apodo, categoria_peso, id_gimnasio, victorias, nocauts, derrotas, estilo) VALUES
('Rico Verhoeven', 'The King of Kickboxing', 'Peso Pesado', 1, 60, 20, 10, 'K-1'),
('Badr Hari', 'The Golden Boy', 'Peso Pesado', 1, 106, 92, 16, 'Holandes'),
('Superbon Singha', 'The Precision Striker', 'Peso Ligero', 2, 114, 28, 35, 'Muay Thai'),
('Giorgio Petrosyan', 'The Doctor', 'Peso Ligero', 5, 105, 42, 3, 'K-1'),
('Chingiz Allazov', 'Chinga', 'Peso Ligero', 4, 60, 37, 5, 'K-1'),
('Marat Grigorian', 'The Armenian Warrior', 'Peso Ligero', 4, 66, 35, 13, 'Holandes'),
('Sitthichai Sitsongpeenong', 'The Killer Kid', 'Peso Welter', 2, 128, 39, 33, 'Muay Thai'),
('Artem Vakhitov', 'The Russian Master', 'Peso Mediano', 1, 23, 8, 6, 'K-1'),
('Tawanchai PK', 'The Phenom', 'Peso Welter', 3, 132, 36, 31, 'Muay Thai'),
('Rodtang Jitmuangnon', 'The Iron Man', 'Peso Mosca', 3, 271, 68, 42, 'Muay Thai'),
('Anissa Meksen', 'C10', 'Peso Mosca', 5, 103, 33, 6, 'K-1'),
('Tiffany van Soest', 'Time Bomb', 'Peso Pluma', 4, 25, 9, 6, 'Americano');
=======
USE campuslands_mysql;

INSERT INTO peleadores_kickboxing
(
    nombre,
    pais,
    categoria,
    victorias,
    derrotas,
    edad,
    estado
)
VALUES
('Carlos Méndez','Guatemala','Welter',18,3,27,'Activo'),
('Juan Herrera','México','Ligero',22,4,29,'Activo'),
('Luis Gómez','Argentina','Pesado',15,6,31,'Suspendido'),
('Miguel Castro','Colombia','Pluma',19,2,24,'Activo'),
('Andrés Pérez','Chile','Mediano',17,5,30,'Retirado'),
('Kevin Morales','Perú','Ligero',13,7,26,'Activo'),
('Ricardo Díaz','Costa Rica','Welter',21,3,28,'Activo'),
('Fernando Ruiz','Ecuador','Mosca',11,8,23,'Activo'),
('José Ramírez','Panamá','Pesado',16,5,33,'Suspendido'),
('Mario López','Honduras','Gallo',20,1,25,'Activo');
