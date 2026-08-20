-- Insercion de datos para carreras urbanas (ejercicio-040)
USE campuslands_mysql;

-- Insercion en pilotos_urbanos
INSERT INTO pilotos_urbanos (apodo, nombre_real, reputacion, estado) VALUES
('DomT', 'Dominic Toretto', 990, 'Activo'),
('BrianO', 'Brian O Conner', 950, 'Activo'),
('HanSeoul', 'Han Lue', 880, 'Activo'),
('LettyO', 'Leticia Ortiz', 870, 'Activo'),
('DK_Takashi', 'Takashi Morimoto', 820, 'Buscado'),
('SeanBos', 'Sean Boswell', 790, 'Activo');

-- Insercion en vehiculos_tuning
INSERT INTO vehiculos_tuning (modelo, id_piloto, traccion, potencia_hp, oxido_nitroso, carreras_ganadas, valor_tuning) VALUES
('Dodge Charger R/T 1970', 1, 'RWD', 900, 'Si', 45, 65000.00),
('Nissan Skyline GT-R R34', 2, 'AWD', 650, 'Si', 38, 55000.00),
('Toyota Supra MK4 2JZ', 2, 'RWD', 800, 'Si', 42, 60000.00),
('Mazda RX-7 VeilSide Fortune', 3, 'RWD', 450, 'Si', 30, 48000.00),
('Plymouth Road Runner 1970', 4, 'RWD', 520, 'Si', 26, 40000.00),
('Nissan 350Z Fairlady', 5, 'RWD', 480, 'Si', 29, 35000.00),
('Ford Mustang Fastback 1967 (RB26)', 6, 'RWD', 500, 'Si', 22, 42000.00),
('Mitsubishi Lancer Evolution IX', 6, 'AWD', 420, 'No', 18, 28000.00),
('Honda S2000 AP2 Turbo', 4, 'RWD', 390, 'Si', 15, 25000.00),
('Subaru Impreza WRX STI', 3, 'AWD', 410, 'No', 19, 29000.00),
('Chevrolet Chevelle SS 454', 1, 'RWD', 600, 'Si', 25, 46000.00),
('Nissan Silvia S15 Spec-R', 5, 'RWD', 430, 'Si', 21, 32000.00);

