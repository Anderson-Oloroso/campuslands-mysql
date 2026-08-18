USE campuslands_mysql;

INSERT INTO equipos_streaming (
    nombre,
    categoria,
    marca,
    precio,
    stock,
    estado
) VALUES
    ('Webcam Full HD C920', 'Webcam', 'Logitech', 89.99, 12, 'activo'),
    ('Microfono USB Pro', 'Microfono', 'HyperX', 129.50, 8, 'activo'),
    ('Aro de Luz LED', 'Iluminacion', 'Neewer', 54.90, 15, 'activo'),
    ('Capturadora Full HD', 'Capturadora', 'Elgato', 159.99, 6, 'activo'),
    ('Brazo Articulado', 'Soporte', 'Elgato', 99.00, 10, 'activo'),
    ('Audifonos Gaming', 'Audio', 'Razer', 119.90, 9, 'activo'),
    ('Panel LED RGB', 'Iluminacion', 'Govee', 74.50, 11, 'activo'),
    ('Microfono Condensador X1', 'Microfono', 'Fifine', 69.99, 14, 'activo'),
    ('Mezclador de Audio USB', 'Audio', 'Behringer', 149.00, 4, 'activo'),
    ('Camara Streaming 4K', 'Webcam', 'Sony', 599.99, 3, 'activo'),
    ('Controlador RGB', 'Iluminacion', 'Corsair', 49.90, 0, 'inactivo'),
    ('Soporte para Monitor', 'Soporte', 'Amazon Basics', 42.75, 7, 'activo');