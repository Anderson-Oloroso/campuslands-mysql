USE campuslands_mysql;

INSERT INTO peliculas_miedo
    (
        titulo,
        director,
        genero,
        anio_estreno,
        puntuacion,
        estado,
        informacion
    )
VALUES
(
    'La Casa del Silencio',
    'Marcos Rivera',
    'Sobrenatural',
    2021,
    8.4,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 112,
        'pais', 'Colombia',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('CinePlay', 'HorrorMax'),
        'premios', JSON_ARRAY('Mejor Pelicula de Terror'),
        'clasificacion', '18+'
    )
),
(
    'Ecos en la Oscuridad',
    'Laura Mendoza',
    'Psicologico',
    2020,
    7.9,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 105,
        'pais', 'Mexico',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('HorrorMax'),
        'premios', JSON_ARRAY(),
        'clasificacion', '16+'
    )
),
(
    'El Bosque Maldito',
    'Daniel Torres',
    'Folk Horror',
    2019,
    8.1,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 118,
        'pais', 'Chile',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('CinePlay', 'DarkStream'),
        'premios', JSON_ARRAY('Mejor Fotografia'),
        'clasificacion', '18+'
    )
),
(
    'Noche de Sangre',
    'Andres Castillo',
    'Slasher',
    2022,
    7.5,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 97,
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'plataformas', JSON_ARRAY('DarkStream'),
        'premios', JSON_ARRAY(),
        'clasificacion', '18+'
    )
),
(
    'La Habitacion 13',
    'Sofia Ramirez',
    'Sobrenatural',
    2018,
    8.7,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 101,
        'pais', 'España',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('CinePlay', 'HorrorMax'),
        'premios', JSON_ARRAY('Mejor Actriz', 'Mejor Guion'),
        'clasificacion', '18+'
    )
),
(
    'El Ultimo Susurro',
    'Carlos Navarro',
    'Psicologico',
    2017,
    7.8,
    'inactiva',
    JSON_OBJECT(
        'duracion_minutos', 109,
        'pais', 'Argentina',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('DarkStream'),
        'premios', JSON_ARRAY('Mejor Guion'),
        'clasificacion', '16+'
    )
),
(
    'Sombras del Pasado',
    'Valeria Cruz',
    'Misterio',
    2023,
    8.9,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 124,
        'pais', 'Colombia',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('CinePlay', 'HorrorMax'),
        'premios', JSON_ARRAY('Mejor Pelicula', 'Mejor Director'),
        'clasificacion', '18+'
    )
),
(
    'La Marca del Demonio',
    'Jorge Salazar',
    'Ocultismo',
    2016,
    7.2,
    'inactiva',
    JSON_OBJECT(
        'duracion_minutos', 115,
        'pais', 'Mexico',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('HorrorMax'),
        'premios', JSON_ARRAY(),
        'clasificacion', '18+'
    )
),
(
    'El Payaso de la Niebla',
    'Miguel Herrera',
    'Slasher',
    2024,
    8.3,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 103,
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'plataformas', JSON_ARRAY('DarkStream', 'HorrorMax'),
        'premios', JSON_ARRAY('Mejor Efectos Especiales'),
        'clasificacion', '18+'
    )
),
(
    'Ritual de Medianoche',
    'Natalia Vargas',
    'Ocultismo',
    2021,
    8.0,
    'activa',
    JSON_OBJECT(
        'duracion_minutos', 121,
        'pais', 'España',
        'idioma', 'Español',
        'plataformas', JSON_ARRAY('CinePlay'),
        'premios', JSON_ARRAY('Mejor Sonido'),
        'clasificacion', '18+'
    )
);