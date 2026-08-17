-- Datos de practica: peliculas de un catalogo de peliculas de miedo,
-- guardadas como JSON (actores, criticas y datos de taquilla).
USE campuslands_mysql;

INSERT INTO peliculas_avanzado (titulo, subgenero, detalles) VALUES
('El Legado Maldito', 'sobrenatural', JSON_OBJECT(
  'actores', JSON_ARRAY('Elena Vidal', 'Marco Solis', 'Renata Duval'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Cine Oscuro', 'puntuacion', 8.0),
    JSON_OBJECT('critico', 'Pantalla de Terror', 'puntuacion', 7.5)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 3000000, 'recaudacion', 21000000)
)),
('Masacre en el Bosque', 'slasher', JSON_OBJECT(
  'actores', JSON_ARRAY('Marco Solis', 'Hugo Ferreira'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Sangre en Pantalla', 'puntuacion', 6.0)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 1200000, 'recaudacion', 8500000)
)),
('Susurros del Manicomio', 'psicologico', JSON_OBJECT(
  'actores', JSON_ARRAY('Elena Vidal', 'Renata Duval'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Cine Oscuro', 'puntuacion', 8.7),
    JSON_OBJECT('critico', 'Pantalla de Terror', 'puntuacion', 8.2),
    JSON_OBJECT('critico', 'Sangre en Pantalla', 'puntuacion', 7.9)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 4500000, 'recaudacion', 32000000)
)),
('Amanecer de los Muertos', 'zombis', JSON_OBJECT(
  'actores', JSON_ARRAY('Hugo Ferreira', 'Ines Marchant', 'Elena Vidal'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Cine Oscuro', 'puntuacion', 6.8)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 6000000, 'recaudacion', 18000000)
)),
('Camara Oculta: Ritual', 'found_footage', JSON_OBJECT(
  'actores', JSON_ARRAY('Ines Marchant'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Sangre en Pantalla', 'puntuacion', 5.5)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 400000, 'recaudacion', 3100000)
)),
('La Casa del Espejo Roto', 'sobrenatural', JSON_OBJECT(
  'actores', JSON_ARRAY('Renata Duval', 'Marco Solis'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Pantalla de Terror', 'puntuacion', 7.0),
    JSON_OBJECT('critico', 'Sangre en Pantalla', 'puntuacion', 6.5)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 2500000, 'recaudacion', 12500000)
)),
('Payaso de Medianoche', 'slasher', JSON_OBJECT(
  'actores', JSON_ARRAY('Hugo Ferreira', 'Ines Marchant'),
  'criticas', JSON_ARRAY(
    JSON_OBJECT('critico', 'Cine Oscuro', 'puntuacion', 6.1)
  ),
  'taquilla', JSON_OBJECT('presupuesto', 900000, 'recaudacion', 5200000)
)),
('Cuarentena Cero', 'zombis', JSON_OBJECT(
  'actores', JSON_ARRAY('Marco Solis', 'Renata Duval'),
  'criticas', JSON_ARRAY(),
  'taquilla', JSON_OBJECT('presupuesto', 2000000, 'recaudacion', 9800000)
));

-- "Cuarentena Cero" todavia no tenia ninguna critica registrada.
-- JSON_ARRAY_APPEND agrega un elemento al final del arreglo "criticas"
-- sin tener que reescribir todo el documento JSON.
UPDATE peliculas_avanzado
SET detalles = JSON_ARRAY_APPEND(
  detalles,
  '$.criticas',
  JSON_OBJECT('critico', 'Sangre en Pantalla', 'puntuacion', 7.2)
)
WHERE titulo = 'Cuarentena Cero';
