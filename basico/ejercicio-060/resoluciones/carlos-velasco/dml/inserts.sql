USE campuslands_mysql;

INSERT INTO categorias_equipo (
    nombre,
    descripcion
) VALUES
    ('Microfonos', 'Equipos para captura de voz y audio'),
    ('Camaras', 'Equipos para captura de video'),
    ('Iluminacion', 'Equipos para mejorar la iluminacion'),
    ('Capturadoras', 'Equipos para captura de senal de video'),
    ('Accesorios', 'Complementos para configuraciones de streaming');


INSERT INTO equipos_streaming (
    nombre,
    marca,
    precio,
    estado,
    id_categoria
) VALUES
    ('Microfono USB Pro', 'HyperX', 599.90, 'activo', 1),
    ('Microfono Condensador X', 'Fifine', 349.90, 'activo', 1),
    ('Camara Full HD Stream', 'Logitech', 749.90, 'activo', 2),
    ('Camara 4K Creator', 'Sony', 2499.90, 'activo', 2),
    ('Panel LED RGB', 'Elgato', 899.90, 'activo', 3),
    ('Aro de Luz Profesional', 'Neewer', 429.90, 'activo', 3),
    ('Capturadora HD60', 'Elgato', 1199.90, 'activo', 4),
    ('Capturadora USB Basica', 'AverMedia', 699.90, 'inactivo', 4),
    ('Brazo Articulado', 'Tonor', 299.90, 'activo', 5),
    ('Soporte para Camara', 'Ulanzi', 259.90, 'inactivo', 5);