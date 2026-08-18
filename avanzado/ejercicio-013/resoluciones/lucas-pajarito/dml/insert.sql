-- ============================================================
-- 5. INSERTAR CATEGORIAS
-- ============================================================

INSERT INTO categorias (nombre_categoria) VALUES
('Terror sobrenatural'),
('Terror psicologico'),
('Slasher'),
('Suspenso'),
('Monstruos'),
('Zombis'),
('Gore'),
('Paranormal');


-- ============================================================
-- 6. INSERTAR DIRECTORES
-- ============================================================

INSERT INTO directores (nombre_director) VALUES
('James Wan'),
('Jordan Peele'),
('Ari Aster'),
('Robert Eggers'),
('John Krasinski'),
('Andy Muschietti'),
('Mike Flanagan'),
('Sam Raimi');


-- ============================================================
-- 7. INSERTAR PELICULAS CON INFORMACION JSON
-- ============================================================

INSERT INTO peliculas
(
    titulo_pelicula,
    id_categoria,
    id_director,
    duracion_minutos,
    anio_publicacion,
    informacion_json
)
VALUES

(
    'El Conjuro',
    1,
    1,
    112,
    2013,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 20,
        'recaudacion_millones', 320,
        'calificacion', 7.5,
        'premios', JSON_ARRAY(
            'Mejor pelicula de terror',
            'Mejor actriz de terror'
        ),
        'plataformas', JSON_ARRAY(
            'Max',
            'Prime Video'
        ),
        'reparto', JSON_ARRAY(
            'Patrick Wilson',
            'Vera Farmiga'
        )
    )
),

(
    'Nosotros',
    2,
    2,
    116,
    2019,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 20,
        'recaudacion_millones', 256,
        'calificacion', 6.8,
        'premios', JSON_ARRAY(
            'Mejor guion original'
        ),
        'plataformas', JSON_ARRAY(
            'Netflix',
            'Max'
        ),
        'reparto', JSON_ARRAY(
            'Lupita Nyongo',
            'Winston Duke'
        )
    )
),

(
    'Hereditary',
    2,
    3,
    127,
    2018,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 10,
        'recaudacion_millones', 82,
        'calificacion', 7.3,
        'premios', JSON_ARRAY(
            'Mejor actriz de terror'
        ),
        'plataformas', JSON_ARRAY(
            'Prime Video',
            'Max'
        ),
        'reparto', JSON_ARRAY(
            'Toni Collette',
            'Alex Wolff'
        )
    )
),

(
    'La Bruja',
    1,
    4,
    93,
    2015,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 4,
        'recaudacion_millones', 40,
        'calificacion', 6.9,
        'premios', JSON_ARRAY(
            'Mejor direccion'
        ),
        'plataformas', JSON_ARRAY(
            'Netflix'
        ),
        'reparto', JSON_ARRAY(
            'Anya Taylor-Joy',
            'Ralph Ineson'
        )
    )
),

(
    'Un Lugar en Silencio',
    4,
    5,
    90,
    2018,
    JSON_OBJECT(
        'clasificacion', 'PG-13',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 17,
        'recaudacion_millones', 340,
        'calificacion', 7.5,
        'premios', JSON_ARRAY(
            'Mejor edicion de sonido'
        ),
        'plataformas', JSON_ARRAY(
            'Paramount Plus',
            'Prime Video'
        ),
        'reparto', JSON_ARRAY(
            'Emily Blunt',
            'John Krasinski'
        )
    )
),

(
    'IT: Capitulo Dos',
    5,
    6,
    169,
    2019,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 79,
        'recaudacion_millones', 473,
        'calificacion', 6.5,
        'premios', JSON_ARRAY(
            'Mejores efectos visuales'
        ),
        'plataformas', JSON_ARRAY(
            'Max',
            'Prime Video'
        ),
        'reparto', JSON_ARRAY(
            'James McAvoy',
            'Jessica Chastain'
        )
    )
),

(
    'Doctor Sueno',
    8,
    7,
    152,
    2019,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 45,
        'recaudacion_millones', 72,
        'calificacion', 7.3,
        'premios', JSON_ARRAY(
            'Mejor fotografia'
        ),
        'plataformas', JSON_ARRAY(
            'Netflix',
            'Max'
        ),
        'reparto', JSON_ARRAY(
            'Ewan McGregor',
            'Rebecca Ferguson'
        )
    )
),

(
    'Posesion Infernal',
    7,
    8,
    97,
    2013,
    JSON_OBJECT(
        'clasificacion', 'NC-17',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 17,
        'recaudacion_millones', 97,
        'calificacion', 6.5,
        'premios', JSON_ARRAY(
            'Mejores efectos especiales'
        ),
        'plataformas', JSON_ARRAY(
            'Prime Video'
        ),
        'reparto', JSON_ARRAY(
            'Bruce Campbell',
            'Sarah Berry'
        )
    )
),

(
    'El Conjuro 2',
    1,
    1,
    134,
    2016,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 40,
        'recaudacion_millones', 321,
        'calificacion', 7.3,
        'premios', JSON_ARRAY(
            'Mejor pelicula sobrenatural'
        ),
        'plataformas', JSON_ARRAY(
            'Max',
            'Prime Video'
        ),
        'reparto', JSON_ARRAY(
            'Patrick Wilson',
            'Vera Farmiga',
            'Madison Wolfe'
        )
    )
),

(
    'Midsommar',
    2,
    3,
    148,
    2019,
    JSON_OBJECT(
        'clasificacion', 'R',
        'pais', 'Estados Unidos',
        'idioma', 'Ingles',
        'presupuesto_millones', 9,
        'recaudacion_millones', 48,
        'calificacion', 7.1,
        'premios', JSON_ARRAY(
            'Mejor direccion artistica'
        ),
        'plataformas', JSON_ARRAY(
            'Prime Video',
            'Max'
        ),
        'reparto', JSON_ARRAY(
            'Florence Pugh',
            'Jack Reynor'
        )
    )
);