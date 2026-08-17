-- Datos de practica: catalogo de un servicio de streaming de peliculas de miedo.
USE campuslands_mysql;

INSERT INTO peliculas_basico (titulo, subgenero, estado, anio_estreno, calificacion_usuarios) VALUES
('El Legado Maldito', 'sobrenatural', 'disponible', 2022, 7.8),
('Masacre en el Bosque', 'slasher', 'disponible', 2021, 6.5),
('Susurros del Manicomio', 'psicologico', 'disponible', 2023, 8.2),
('Amanecer de los Muertos', 'zombis', 'retirada', 2019, 6.9),
('Camara Oculta: Ritual', 'found_footage', 'disponible', 2024, 5.8),
('La Casa del Espejo Roto', 'sobrenatural', 'proximamente', 2026, 0),
('Payaso de Medianoche', 'slasher', 'en_revision', 2020, 6.2),
('Cuarentena Cero', 'zombis', 'disponible', 2023, 7.1),
('La Ultima Cinta', 'found_footage', 'retirada', 2018, 5.4);
