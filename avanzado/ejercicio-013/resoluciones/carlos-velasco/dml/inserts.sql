USE campuslands_mysql;


INSERT INTO peliculas (
    titulo,
    anio_estreno,
    genero,
    estado,
    detalles_json
) VALUES
(
    'La Casa de la Niebla',
    2021,
    'Terror',
    'disponible',
    '{
        "director": "Elena Vargas",
        "pais": "Mexico",
        "duracion_minutos": 108,
        "clasificacion": "18+",
        "puntuacion": 8.4,
        "actores": [
            "Marina Torres",
            "Diego Salazar",
            "Lucia Mendez"
        ],
        "etiquetas": [
            "fantasmas",
            "casa_aislada",
            "misterio"
        ],
        "premios": 3
    }'
),
(
    'Sombras del Bosque',
    2020,
    'Terror',
    'disponible',
    '{
        "director": "Carlos Fuentes",
        "pais": "España",
        "duracion_minutos": 115,
        "clasificacion": "16+",
        "puntuacion": 7.9,
        "actores": [
            "Alba Ruiz",
            "Javier Leon",
            "Nora Campos"
        ],
        "etiquetas": [
            "bosque",
            "criaturas",
            "supervivencia"
        ],
        "premios": 2
    }'
),
(
    'El Ultimo Susurro',
    2019,
    'Terror Psicologico',
    'disponible',
    '{
        "director": "Martin Ortega",
        "pais": "Argentina",
        "duracion_minutos": 102,
        "clasificacion": "18+",
        "puntuacion": 8.7,
        "actores": [
            "Sofia Rios",
            "Mateo Cruz",
            "Irene Paz"
        ],
        "etiquetas": [
            "psicologico",
            "obsesion",
            "misterio"
        ],
        "premios": 5
    }'
),
(
    'No Mires Atras',
    2022,
    'Slasher',
    'disponible',
    '{
        "director": "Victor Molina",
        "pais": "Estados Unidos",
        "duracion_minutos": 96,
        "clasificacion": "18+",
        "puntuacion": 7.5,
        "actores": [
            "Emma Stone",
            "Ryan Cole",
            "Mia Brooks"
        ],
        "etiquetas": [
            "asesino",
            "supervivencia",
            "bosque"
        ],
        "premios": 1
    }'
),
(
    'El Ritual de Medianoche',
    2018,
    'Terror Sobrenatural',
    'disponible',
    '{
        "director": "Ana Beltran",
        "pais": "Colombia",
        "duracion_minutos": 124,
        "clasificacion": "18+",
        "puntuacion": 8.9,
        "actores": [
            "Daniel Rojas",
            "Clara Vega",
            "Samuel Ortiz"
        ],
        "etiquetas": [
            "rituales",
            "demonios",
            "ocultismo"
        ],
        "premios": 6
    }'
),
(
    'Ecos en el Sotano',
    2023,
    'Terror',
    'disponible',
    '{
        "director": "Laura Campos",
        "pais": "Chile",
        "duracion_minutos": 101,
        "clasificacion": "16+",
        "puntuacion": 7.8,
        "actores": [
            "Valentina Ruiz",
            "Pedro Marin",
            "Julia Torres"
        ],
        "etiquetas": [
            "sotano",
            "fantasmas",
            "familia"
        ],
        "premios": 2
    }'
),
(
    'La Maldicion del Lago',
    2017,
    'Terror Sobrenatural',
    'retirada',
    '{
        "director": "Roberto Silva",
        "pais": "Peru",
        "duracion_minutos": 112,
        "clasificacion": "16+",
        "puntuacion": 7.2,
        "actores": [
            "Gabriel Soto",
            "Elena Marquez",
            "Tomas Vidal"
        ],
        "etiquetas": [
            "lago",
            "maldicion",
            "leyenda"
        ],
        "premios": 1
    }'
),
(
    'Habitacion 13',
    2024,
    'Terror Psicologico',
    'disponible',
    '{
        "director": "Natalia Herrera",
        "pais": "Mexico",
        "duracion_minutos": 99,
        "clasificacion": "18+",
        "puntuacion": 8.2,
        "actores": [
            "Camila Reyes",
            "Andres Luna",
            "Sara Mendez"
        ],
        "etiquetas": [
            "hotel",
            "psicologico",
            "misterio"
        ],
        "premios": 4
    }'
);