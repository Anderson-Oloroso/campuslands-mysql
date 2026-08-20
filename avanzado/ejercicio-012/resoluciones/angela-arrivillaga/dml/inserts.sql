use playlist_musical_db;

insert into generos_musicales (nombre_genero, descripcion) values
('synthwave', 'sonidos electronicos retro inspirados en los años 80'),
('lo-fi hip hop', 'beats relajantes ideales para estudiar o concentrarse'),
('rock alternativo', 'guitarras dinamicas y voces melodicas'),
('electrónica', 'ritmos bailables de alta energia');

insert into canciones (titulo_cancion, artista, id_genero, duracion_segundos, reproducciones, calificacion, estado_cancion) values
('nightcall', 'kavinsky', 1, 259, 1540000, 4.85, 'activa'),
('resonance', 'home', 1, 212, 2300000, 4.90, 'activa'),
('chilled coffee', 'lo-fi panda', 2, 165, 890000, 4.50, 'activa'),
('daydreaming', 'sleepy cat', 2, 180, 450000, 4.20, 'pausada'),
('everlong', 'foo fighters', 3, 250, 3100000, 4.95, 'activa'),
('basket case', 'green day', 3, 181, 2800000, 4.80, 'activa'),
('strobe', 'deadmau5', 4, 637, 1950000, 4.75, 'activa'),
('levels', 'avicii', 4, 199, 4100000, 4.92, 'archivada');