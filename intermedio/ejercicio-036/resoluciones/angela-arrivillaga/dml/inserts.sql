use hiperdeportivos_1fn_db;

insert into fabricantes_hiperautos (nombre_fabricante, pais_origen) values
('Bugatti', 'Francia'),
('Koenigsegg', 'Suecia'),
('Pagani', 'Italia'),
('Rimac', 'Croacia'),
('McLaren', 'Reino Unido'),
('Ferrari', 'Italia');

insert into hiperautos (id_fabricante, nombre_modelo, potencia_hp, velocidad_maxima_kmh, precio_usd, estado_produccion) values
(1, 'Bugatti Chiron Super Sport 300+', 1600, 490, 3900000.00, 'agotado'),
(1, 'Bugatti Tourbillon', 1800, 445, 4100000.00, 'en_produccion'),
(2, 'Koenigsegg Jesko Absolut', 1600, 531, 3400000.00, 'limitado'),
(2, 'Koenigsegg Gemera', 1700, 400, 1700000.00, 'en_produccion'),
(3, 'Pagani Utopia', 852, 380, 2500000.00, 'limitado'),
(4, 'Rimac Nevera', 1914, 412, 2400000.00, 'en_produccion'),
(5, 'McLaren W1', 1258, 350, 2100000.00, 'limitado'),
(6, 'Ferrari F80', 1200, 350, 3900000.00, 'concept');

insert into tecnologias_hiperautos (id_hiperauto, nombre_tecnologia, tipo_sistema) values
(1, 'Cola Larga Aerodinámica', 'Aerodinámica'),
(1, 'Control de Estabilidad Vectorial', 'Electrónica'),
(2, 'Motor V16 Atmosférico', 'Propulsión'),
(2, 'Instrumentación de Titanio Impresa en 3D', 'Interior'),
(3, 'Geometría de Suspensión Triplex', 'Suspensión'),
(3, 'Transmisión Light Speed 9 Velocidades', 'Transmisión'),
(4, 'Motor Biturbo FreeValve', 'Propulsión'),
(4, 'Sistema Híbrido Directo de Tracción', 'Hibridación'),
(5, 'Monocasco de Carbo-Titanio HP62', 'Estructural'),
(5, 'Aerodinámica Activa Flaps Traseros', 'Aerodinámica'),
(6, 'Vectorización de Par All-Wheel Torque', 'Electrónica'),
(6, 'Frenos Regenerativos de Alto Rendimiento', 'Frenos'),
(7, 'Efecto Suuelo Formula 1', 'Aerodinámica'),
(7, 'Suspensión Activa de Control Hidráulico', 'Suspensión'),
(8, 'Sistema Híbrido Derivado de WEC', 'Hibridación'),
(8, 'Aerodinámica Activa de Soplado', 'Aerodinámica');