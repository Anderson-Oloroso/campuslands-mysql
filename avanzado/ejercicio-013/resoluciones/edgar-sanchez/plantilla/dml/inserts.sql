INSERT INTO estudios_cinematograficos (nombre_estudio, pais_origen, anio_fundacion) VALUES
('Blumhouse Productions', 'Estados Unidos', 2000),
('A24', 'Estados Unidos', 2012),
('Ghost House Pictures', 'Estados Unidos', 2002);

INSERT INTO directores_cine (nombre_director, nacionalidad, fecha_nacimiento) VALUES
('James Wan', 'Australiano', '1977-02-26'),
('Ari Aster', 'Estadounidense', '1986-07-15'),
('Scott Derrickson', 'Estadounidense', '1966-07-16');

INSERT INTO peliculas_miedo (estudio_id, director_id, titulo, anio_estreno, duracion_minutos, metadatos_json) VALUES
(1, 1, 'El Conjuro', 2013, 112, JSON_OBJECT(
    'subgenero', 'Sobrenatural',
    'clasificacion', 'R',
    'presupuesto_usd', 20000000,
    'elementos_terror', JSON_ARRAY('Posesión', 'Casas Embrujadas', 'Demonios'),
    'recaudacion_global_usd', 319500000
)),
(2, 2, 'Hereditary', 2018, 127, JSON_OBJECT(
    'subgenero', 'Terror Psicológico',
    'clasificacion', 'R',
    'presupuesto_usd', 10000000,
    'elementos_terror', JSON_ARRAY('Cultos', 'Tragedia Familiar', 'Demonios'),
    'recaudacion_global_usd', 82500000
)),
(1, 3, 'Siniestro', 2012, 110, JSON_OBJECT(
    'subgenero', 'Metraje Encontrado / Sobrenatural',
    'clasificacion', 'R',
    'presupuesto_usd', 3000000,
    'elementos_terror', JSON_ARRAY('Cintas de Video', 'Deidades Paganas', 'Niños'),
    'recaudacion_global_usd', 87700000
)),
(2, 2, 'Midsommar', 2019, 147, JSON_OBJECT(
    'subgenero', 'Folk Horror',
    'clasificacion', 'R',
    'presupuesto_usd', 9000000,
    'elementos_terror', JSON_ARRAY('Cultos', 'Rituales', 'Luz de Día'),
    'recaudacion_global_usd', 48000000
));

INSERT INTO calificaciones_peliculas (pelicula_id, plataforma, puntuacion, resena_detalles_json, fecha_registro) VALUES
(1, 'Rotten Tomatoes', 8.6, JSON_OBJECT('criticos_veredicto', 'Certificado Fresco', 'audiencia_score', 83), '2026-01-10'),
(1, 'IMDb', 7.5, JSON_OBJECT('votos_totales', 520000, 'top_pais', 'Estados Unidos'), '2026-01-10'),
(2, 'Rotten Tomatoes', 9.0, JSON_OBJECT('criticos_veredicto', 'Certificado Fresco', 'audiencia_score', 70), '2026-01-15'),
(2, 'IMDb', 7.3, JSON_OBJECT('votos_totales', 380000, 'top_pais', 'Reino Unido'), '2026-01-15'),
(3, 'Rotten Tomatoes', 6.3, JSON_OBJECT('criticos_veredicto', 'Fresco', 'audiencia_score', 62), '2026-02-01'),
(4, 'Rotten Tomatoes', 8.3, JSON_OBJECT('criticos_veredicto', 'Certificado Fresco', 'audiencia_score', 63), '2026-02-10');