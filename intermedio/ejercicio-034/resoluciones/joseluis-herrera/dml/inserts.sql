USE campuslands_mysql;

INSERT INTO motos (
    marca,
    modelo,
    categoria,
    anio,
    precio,
    estado
) VALUES
    ('Yamaha', 'MT-07', 'Naked', 2023, 42000.00, 'disponible'),
    ('Yamaha', 'R3', 'Deportiva', 2022, 35000.00, 'vendida'),
    ('Honda', 'CB500F', 'Naked', 2023, 48000.00, 'disponible'),
    ('Honda', 'XR190L', 'Doble proposito', 2021, 28000.00, 'mantenimiento'),
    ('Suzuki', 'GSX-S750', 'Naked', 2022, 52000.00, 'disponible'),
    ('Suzuki', 'Gixxer 250', 'Naked', 2023, 32000.00, 'vendida'),
    ('Kawasaki', 'Ninja 400', 'Deportiva', 2024, 56000.00, 'disponible'),
    ('Kawasaki', 'Z400', 'Naked', 2023, 50000.00, 'disponible'),
    ('Honda', 'CB190R', 'Naked', 2022, 26000.00, 'vendida'),
    ('Yamaha', 'XMAX 300', 'Scooter', 2024, 47000.00, 'disponible');