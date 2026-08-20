use campuslands_mysql;

-- insercion de registros en playlists
insert into playlists (nombre_playlist, creador, genero_principal) values
('lo-fi beats para estudiar', 'angela', 'lo-fi'),
('synthwave nocturno', 'alex', 'synthwave'),
('rock clasico legendario', 'carlos', 'rock'),
('pop coquette vibes', 'sofia', 'pop');

-- insercion de registros en canciones
insert into canciones (playlist_id, titulo, artista, duracion_segundos, reproducciones, estado_cancion) values
(1, 'coffee bean dreams', 'lofi cat', 185, 125000, 'activa'),
(1, 'midnight study session', 'chillhop raccoon', 210, 98000, 'activa'),
(2, 'neon highway', 'vector 84', 245, 340000, 'exclusiva'),
(2, 'cyberpunk sunrise', 'synth pilot', 198, 215000, 'activa'),
(3, 'stairway to heaven', 'led zeppelin', 482, 1500000, 'activa'),
(3, 'sweet child o mine', 'guns n roses', 356, 1200000, 'archivada'),
(4, 'pastel heart', 'coquette dreams', 172, 85000, 'activa'),
(4, 'strawberry bubblegum', 'sweet pop', 165, 62000, 'exclusiva');