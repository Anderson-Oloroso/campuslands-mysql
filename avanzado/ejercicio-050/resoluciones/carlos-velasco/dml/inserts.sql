USE campuslands_mysql;

INSERT INTO tatuajes (
    nombre_cliente,
    artista,
    estilo,
    zona_cuerpo,
    tamano_cm,
    precio,
    estado,
    fecha_tatuaje
) VALUES
    ('Valentina Gomez', 'Diego Ramirez', 'Realismo', 'Brazo', 18.50, 850.00, 'realizado', '2026-01-15'),
    ('Mateo Herrera', 'Laura Castillo', 'Geometrico', 'Pecho', 12.00, 620.00, 'realizado', '2026-01-22'),
    ('Camila Torres', 'Diego Ramirez', 'Minimalista', 'Muneca', 5.50, 280.00, 'reservado', '2026-02-05'),
    ('Santiago Morales', 'Andres Vega', 'Blackwork', 'Espalda', 25.00, 1200.00, 'realizado', '2026-02-12'),
    ('Sofia Martinez', 'Laura Castillo', 'Floral', 'Hombro', 10.00, 480.00, 'pendiente', '2026-02-20'),
    ('Daniel Lopez', 'Andres Vega', 'Tradicional', 'Pantorrilla', 16.00, 700.00, 'realizado', '2026-03-03'),
    ('Isabella Cruz', 'Diego Ramirez', 'Realismo', 'Costillas', 20.00, 980.00, 'reservado', '2026-03-10'),
    ('Nicolas Perez', 'Laura Castillo', 'Minimalista', 'Antebrazo', 7.00, 320.00, 'pendiente', '2026-03-18'),
    ('Mariana Ruiz', 'Andres Vega', 'Acuarela', 'Espalda', 14.50, 760.00, 'realizado', '2026-03-25'),
    ('Gabriel Flores', 'Diego Ramirez', 'Blackwork', 'Brazo', 11.00, 540.00, 'pendiente', '2026-04-02');