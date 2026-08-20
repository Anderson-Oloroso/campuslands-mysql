USE campuslands_mysql;

INSERT INTO peliculas_miedo
    (titulo, anio_estreno, estado, puntuacion, detalles)
VALUES
(
    'La Casa del Bosque',
    2020,
    'activa',
    8.4,
    JSON_OBJECT(
        'director', 'Marcos Herrera',
        'subgenero', 'terror sobrenatural',
        'duracion_minutos', 112,
        'reparto', JSON_ARRAY('Laura Gomez', 'Daniel Ruiz'),
        'caracteristicas', JSON_ARRAY('fantasmas', 'bosque', 'maldicion')
    )
),
(
    'Noche en el Hospital',
    2019,
    'activa',
    7.8,
    JSON_OBJECT(
        'director', 'Sofia Martinez',
        'subgenero', 'terror psicologico',
        'duracion_minutos', 105,
        'reparto', JSON_ARRAY('Ana Torres', 'Carlos Mendez'),
        'caracteristicas', JSON_ARRAY('hospital', 'misterio', 'apariciones')
    )
),
(
    'El Ultimo Visitante',
    2021,
    'activa',
    9.1,
    JSON_OBJECT(
        'director', 'Andres Castillo',
        'subgenero', 'terror sobrenatural',
        'duracion_minutos', 118,
        'reparto', JSON_ARRAY('Miguel Santos', 'Elena Vargas'),
        'caracteristicas', JSON_ARRAY('casa', 'entidad', 'maldicion')
    )
),
(
    'Sombras del Pasillo',
    2018,
    'inactiva',
    6.9,
    JSON_OBJECT(
        'director', 'Ricardo Leon',
        'subgenero', 'suspenso',
        'duracion_minutos', 98,
        'reparto', JSON_ARRAY('Julia Perez', 'Martin Lopez'),
        'caracteristicas', JSON_ARRAY('sombras', 'pasillo', 'misterio')
    )
),
(
    'La Habitacion 13',
    2022,
    'activa',
    8.7,
    JSON_OBJECT(
        'director', 'Valeria Cruz',
        'subgenero', 'terror psicologico',
        'duracion_minutos', 121,
        'reparto', JSON_ARRAY('Sergio Diaz', 'Paula Reyes'),
        'caracteristicas', JSON_ARRAY('hotel', 'habitacion', 'paranormal')
    )
),
(
    'Ritual de Medianoche',
    2017,
    'activa',
    7.5,
    JSON_OBJECT(
        'director', 'Fernando Rojas',
        'subgenero', 'terror satanico',
        'duracion_minutos', 109,
        'reparto', JSON_ARRAY('Mario Silva', 'Claudia Flores'),
        'caracteristicas', JSON_ARRAY('ritual', 'culto', 'maldicion')
    )
),
(
    'El Espejo Roto',
    2023,
    'activa',
    9.3,
    JSON_OBJECT(
        'director', 'Natalia Herrera',
        'subgenero', 'terror sobrenatural',
        'duracion_minutos', 115,
        'reparto', JSON_ARRAY('Diego Morales', 'Camila Ortiz'),
        'caracteristicas', JSON_ARRAY('espejo', 'fantasma', 'misterio')
    )
),
(
    'La Casa Abandonada',
    2016,
    'inactiva',
    6.4,
    JSON_OBJECT(
        'director', 'Jorge Molina',
        'subgenero', 'terror clasico',
        'duracion_minutos', 102,
        'reparto', JSON_ARRAY('Ruben Castro', 'Marta Navarro'),
        'caracteristicas', JSON_ARRAY('casa', 'fantasmas', 'abandono')
    )
);