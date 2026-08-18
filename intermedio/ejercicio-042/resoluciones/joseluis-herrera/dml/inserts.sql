USE campuslands_mysql;

INSERT INTO playlists (
    nombre,
    descripcion,
    genero_principal,
    cantidad_canciones,
    duracion_minutos,
    estado,
    fecha_creacion
) VALUES
('Morning Energy', 'Canciones para comenzar el dia con energia', 'Pop', 18, 62.50, 'activa', '2026-01-10'),
('Rock Clasico', 'Seleccion de grandes canciones de rock', 'Rock', 25, 94.30, 'activa', '2026-01-15'),
('Noche Latina', 'Musica latina para escuchar por la noche', 'Latino', 20, 76.40, 'activa', '2026-02-05'),
('Jazz Relax', 'Jazz suave para momentos tranquilos', 'Jazz', 15, 58.20, 'activa', '2026-02-12'),
('Electronica Focus', 'Musica electronica para concentrarse', 'Electronica', 22, 83.70, 'activa', '2026-02-20'),
('Acustico Weekend', 'Canciones acusticas para el fin de semana', 'Acustico', 12, 45.80, 'activa', '2026-03-01'),
('Clasicos Pop', 'Pop de diferentes epocas', 'Pop', 30, 112.60, 'activa', '2026-03-08'),
('Instrumental Study', 'Musica instrumental para estudiar', 'Instrumental', 16, 71.30, 'inactiva', '2026-03-15');