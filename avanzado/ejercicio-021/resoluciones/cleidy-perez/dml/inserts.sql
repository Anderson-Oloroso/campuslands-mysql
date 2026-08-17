-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE dibujo_digital;

INSERT INTO Artistas (artista_id, nombre, email) VALUES
(1, 'Sofía Ramírez', 'sofia.art@example.com'),
(2, 'Carlos Mendoza', 'cmendoza@example.com');

INSERT INTO Proyectos (proyecto_id, titulo, artista_id, fecha_creacion) VALUES
(101, 'Retrato Cyberpunk', 1, '2026-01-15'),
(102, 'Paisaje Fantasía', 2, '2026-02-10');