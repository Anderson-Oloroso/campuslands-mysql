USE academia_kickboxing;

INSERT INTO categorias (nombre, peso_limite_kg) VALUES 
('Pluma', 65.00), ('Ligero', 70.00), ('Welter', 77.00), ('Medio', 84.00);

INSERT INTO luchadores (nombre, victorias, estado, id_categoria) VALUES 
('Carlos Ruiz', 15, 'activo', 1), ('Miguel Torres', 8, 'activo', 1),
('Javier Mendez', 22, 'activo', 2), ('Luis Paredes', 30, 'retirado', 2),
('Andres Silva', 12, 'activo', 3), ('Roberto Gomez', 5, 'activo', 3),
('Daniel Soto', 18, 'activo', 4), ('Fernando Castro', 40, 'retirado', 4);