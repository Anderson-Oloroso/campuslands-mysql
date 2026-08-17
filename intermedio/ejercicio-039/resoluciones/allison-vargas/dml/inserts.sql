USE kickboxing_fk_db;

-- Inserción de gimnasios organizadores maestros
INSERT INTO gimnasios (nombre_gimnasio, ciudad, pais) VALUES
('Tiger Academy', 'Madrid', 'España'),
('Golden Glory Gym', 'Barcelona', 'España'),
('Mike s Gym', 'Valencia', 'España'),
('Maikel Fighter Center', 'Sevilla', 'España');

-- Inserción de 8 registros de combates vinculados mediante FK
INSERT INTO combates_kickboxing (id_gimnasio, luchador_azul, luchador_rojo, categoria_peso, puntaje_azul, puntaje_rojo, estado_combate) VALUES
(1, 'Jonathan Green', 'Alex Pereira', 'Peso Mediano', 28, 29, 'Finalizado'),
(1, 'Rico Verhoeven', 'Badr Hari', 'Peso Pesado', 30, 27, 'Finalizado'),
(2, 'Giorgio Petrosyan', 'Superbon Singha', 'Peso Ligero', 29, 29, 'Finalizado'),
(2, 'Tevin Farmer', 'Floyd Smith', 'Peso Pluma', 10, 12, 'En Curso'),
(3, 'Cyril Benzaquen', 'Yohan Lidon', 'Peso Mediano', 0, 0, 'Programado'),
(3, 'Sergei Maslobojev', 'Donegi Abena', 'Peso Semipesado', 0, 0, 'Programado'),
(4, 'Tython Silva', 'Marc de Bonte', 'Peso Welter', 15, 18, 'En Curso'),
(4, 'Stoyan Koprivlenski', 'Dzhabar Askerov', 'Peso Superwélter', 25, 24, 'Finalizado');
