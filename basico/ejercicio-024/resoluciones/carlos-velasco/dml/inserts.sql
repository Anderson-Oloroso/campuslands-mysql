USE campuslands_mysql;

INSERT INTO trabajos_soldadura (
    nombre_trabajo,
    soldador,
    tipo_soldadura,
    material,
    horas_trabajo,
    costo,
    estado
) VALUES
(
    'Estructura Metalica A',
    'Carlos Mendoza',
    'MIG',
    'Acero',
    8.50,
    1250.00,
    'finalizado'
),
(
    'Reparacion de Tuberia',
    'Laura Castillo',
    'TIG',
    'Acero inoxidable',
    5.00,
    850.00,
    'en_proceso'
),
(
    'Puerta Industrial',
    'Andres Ramirez',
    'MIG',
    'Acero',
    6.75,
    980.00,
    'pendiente'
),
(
    'Baranda de Seguridad',
    'Sofia Torres',
    'Electrodo',
    'Acero',
    7.25,
    720.00,
    'finalizado'
),
(
    'Tanque de Almacenamiento',
    'Diego Herrera',
    'TIG',
    'Aluminio',
    12.00,
    2100.00,
    'en_proceso'
),
(
    'Soporte Industrial',
    'Valentina Cruz',
    'MIG',
    'Acero',
    4.50,
    600.00,
    'cancelado'
),
(
    'Marco Metalico',
    'Mateo Lopez',
    'Electrodo',
    'Hierro',
    6.00,
    680.00,
    'finalizado'
),
(
    'Escalera Industrial',
    'Camila Perez',
    'MIG',
    'Acero',
    9.50,
    1450.00,
    'pendiente'
),
(
    'Reparacion de Chasis',
    'Daniel Fuentes',
    'TIG',
    'Aluminio',
    10.25,
    1750.00,
    'cancelado'
),
(
    'Estructura para Maquinaria',
    'Natalia Morales',
    'MIG',
    'Acero',
    11.00,
    1900.00,
    'en_proceso'
);