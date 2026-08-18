USE campuslands_mysql;

INSERT INTO autos_hiperdeportivos (
    marca,
    modelo,
    anio,
    motor,
    potencia_cv,
    velocidad_maxima_kmh,
    precio_usd,
    estado
) VALUES
    ('Bugatti', 'Chiron Super Sport', 2022, 'W16 8.0L', 1600, 490.48, 3900000.00, 'disponible'),
    ('Koenigsegg', 'Jesko Absolut', 2024, 'V8 5.0L Biturbo', 1600, 531.00, 3200000.00, 'reservado'),
    ('Pagani', 'Huayra BC', 2021, 'V12 6.0L Biturbo', 800, 383.00, 2800000.00, 'vendido'),
    ('McLaren', 'Speedtail', 2020, 'V8 4.0L Biturbo', 1070, 403.00, 2250000.00, 'disponible'),
    ('Ferrari', 'SF90 XX Stradale', 2024, 'V8 4.0L Hibrido', 1030, 320.00, 850000.00, 'reservado'),
    ('Lamborghini', 'Revuelto', 2024, 'V12 6.5L Hibrido', 1001, 350.00, 608000.00, 'disponible'),
    ('Rimac', 'Nevera', 2023, 'Electrico Cuatro Motores', 1914, 412.00, 2400000.00, 'vendido'),
    ('Aston Martin', 'Valkyrie', 2022, 'V12 6.5L', 1160, 355.00, 3000000.00, 'disponible'),
    ('Hennessey', 'Venom F5', 2023, 'V8 6.6L Biturbo', 1817, 500.00, 2100000.00, 'reservado'),
    ('Mercedes-AMG', 'One', 2023, 'V6 1.6L Hibrido', 1063, 352.00, 2700000.00, 'vendido');