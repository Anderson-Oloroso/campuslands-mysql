USE campuslands_mysql;

INSERT INTO saltos (
    participante,
    zona_salto,
    nivel_experiencia,
    estado,
    altura_salto_m,
    costo
) VALUES
    ('Carlos Mendoza', 'Chimaltenango', 'principiante', 'realizado', 2500, 350.00),
    ('Laura Castillo', 'Chimaltenango', 'intermedio', 'realizado', 3000, 450.00),
    ('Diego Ramirez', 'Chimaltenango', 'avanzado', 'programado', 3500, 550.00),
    ('Sofia Herrera', 'Antigua Guatemala', 'principiante', 'realizado', 2500, 380.00),
    ('Mateo Lopez', 'Antigua Guatemala', 'intermedio', 'realizado', 3000, 480.00),
    ('Valeria Cruz', 'Antigua Guatemala', 'avanzado', 'cancelado', 3500, 580.00),
    ('Andres Morales', 'Escuintla', 'principiante', 'realizado', 2200, 320.00),
    ('Daniela Perez', 'Escuintla', 'intermedio', 'realizado', 2800, 420.00),
    ('Jorge Alvarez', 'Escuintla', 'avanzado', 'programado', 3200, 520.00),
    ('Fernanda Ruiz', 'Escuintla', 'intermedio', 'realizado', 2800, 420.00),
    ('Miguel Santos', 'Chimaltenango', 'intermedio', 'realizado', 3000, 450.00),
    ('Gabriela Torres', 'Antigua Guatemala', 'principiante', 'programado', 2500, 380.00);