USE campuslands_mysql;

INSERT INTO autos_hiperdeportivos (
    marca,
    modelo,
    potencia_hp,
    velocidad_max_kmh,
    precio_millones,
    anio,
    estado
) VALUES
    ('Bugatti', 'Chiron Super Sport', 1600, 490, 5.20, 2022, 'vendido'),
    ('Koenigsegg', 'Jesko Absolut', 1600, 531, 3.40, 2024, 'reservado'),
    ('Pagani', 'Huayra Roadster BC', 802, 383, 3.50, 2021, 'vendido'),
    ('Rimac', 'Nevera', 1914, 412, 2.20, 2023, 'disponible'),
    ('McLaren', 'Speedtail', 1055, 403, 2.25, 2022, 'vendido'),
    ('Aston Martin', 'Valkyrie', 1160, 350, 3.00, 2023, 'disponible'),
    ('Ferrari', 'SF90 XX Stradale', 1030, 320, 0.85, 2024, 'reservado'),
    ('Lamborghini', 'Revuelto', 1001, 350, 0.65, 2025, 'disponible'),
    ('Hennessey', 'Venom F5', 1817, 437, 2.10, 2024, 'disponible'),
    ('Mercedes-AMG', 'One', 1063, 352, 2.70, 2023, 'vendido');