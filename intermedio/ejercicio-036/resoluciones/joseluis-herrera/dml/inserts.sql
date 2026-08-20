USE campuslands_mysql;

INSERT INTO autos_hiperdeportivos (
    marca,
    modelo,
    pais_origen,
    anio,
    potencia_hp,
    velocidad_maxima_kmh,
    precio_usd,
    color,
    estado
) VALUES
    ('Bugatti', 'Chiron Super Sport', 'Francia', 2022, 1600, 440, 3900000.00, 'Negro', 'vendido'),
    ('Koenigsegg', 'Jesko Absolut', 'Suecia', 2024, 1600, 531, 2800000.00, 'Blanco', 'reservado'),
    ('Pagani', 'Huayra BC', 'Italia', 2021, 800, 370, 3500000.00, 'Rojo', 'vendido'),
    ('Rimac', 'Nevera', 'Croacia', 2023, 1914, 412, 2400000.00, 'Azul', 'disponible'),
    ('Hennessey', 'Venom F5', 'Estados Unidos', 2024, 1817, 500, 2600000.00, 'Negro', 'reservado'),
    ('McLaren', 'Speedtail', 'Reino Unido', 2020, 1055, 403, 2250000.00, 'Gris', 'vendido'),
    ('Aston Martin', 'Valkyrie', 'Reino Unido', 2023, 1160, 402, 3000000.00, 'Verde', 'disponible'),
    ('Ferrari', 'SF90 XX Stradale', 'Italia', 2024, 1030, 320, 850000.00, 'Rojo', 'disponible'),
    ('Lamborghini', 'Revuelto', 'Italia', 2024, 1001, 350, 608000.00, 'Amarillo', 'reservado'),
    ('Zenvo', 'Aurora', 'Dinamarca', 2025, 1850, 450, 3200000.00, 'Azul', 'disponible');