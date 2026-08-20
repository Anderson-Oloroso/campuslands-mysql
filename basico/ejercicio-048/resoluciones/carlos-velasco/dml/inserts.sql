USE campuslands_mysql;

INSERT INTO destinos_turisticos
    (
        nombre,
        pais,
        ciudad,
        tipo_destino,
        precio_promedio,
        fecha_recomendacion,
        disponible
    )
VALUES
    (
        'Ciudad Colonial',
        'Guatemala',
        'Antigua Guatemala',
        'Cultural',
        85.00,
        '2026-01-10',
        TRUE
    ),
    (
        'Parque Nacional Tikal',
        'Guatemala',
        'Flores',
        'Arqueologico',
        120.00,
        '2026-01-15',
        TRUE
    ),
    (
        'Isla Mujeres',
        'Mexico',
        'Isla Mujeres',
        'Playa',
        150.00,
        '2026-02-05',
        TRUE
    ),
    (
        'Cartagena Historica',
        'Colombia',
        'Cartagena',
        'Cultural',
        135.00,
        '2026-02-12',
        TRUE
    ),
    (
        'San Andres',
        'Colombia',
        'San Andres',
        'Playa',
        180.00,
        '2026-02-20',
        TRUE
    ),
    (
        'Cusco Historico',
        'Peru',
        'Cusco',
        'Cultural',
        110.00,
        '2026-03-01',
        TRUE
    ),
    (
        'Machu Picchu',
        'Peru',
        'Aguas Calientes',
        'Arqueologico',
        220.00,
        '2026-03-08',
        TRUE
    ),
    (
        'Roatan',
        'Honduras',
        'Roatan',
        'Playa',
        165.00,
        '2026-03-15',
        TRUE
    ),
    (
        'Ciudad de Panama',
        'Panama',
        'Ciudad de Panama',
        'Urbano',
        125.00,
        '2026-03-22',
        TRUE
    ),
    (
        'Rio de Janeiro',
        'Brasil',
        'Rio de Janeiro',
        'Urbano',
        195.00,
        '2026-04-01',
        FALSE
    );