INSERT INTO sagas_scifi (nombre_saga, creador, anio_inicio) VALUES
('Star Wars', 'George Lucas', 1977),
('Dune', 'Frank Herbert', 1965),
('Star Trek', 'Gene Roddenberry', 1966);

INSERT INTO planetas_scifi (saga_id, nombre_planeta, clima, tipo_terreno) VALUES
(1, 'Tatooine', 'Árido', 'Desierto'),
(1, 'Alderaan', 'Templado', 'Montañas y Pastizales'),
(2, 'Arrakis', 'Extremo Seco', 'Dunas y Rocas'),
(2, 'Caladan', 'Lluvioso', 'Océanos y Bosques'),
(3, 'Vulcano', 'Cálido y Seco', 'Desiertos y Volcanes');

INSERT INTO naves_scifi (saga_id, nombre_nave, modelo_clase, capacidad_tripulacion, velocidad_maxima_hiperespacio) VALUES
(1, 'Halcón Milenario', 'Carguero Ligero YT-1300', 4, 1.50),
(1, 'Destructor Estelar', 'Clase Imperial I', 37000, 1.00),
(2, 'Ornitóptero Real', 'Atreides Mark IV', 6, 0.80),
(3, 'USS Enterprise', 'Clase Constitución', 430, 2.00);

INSERT INTO personajes_scifi (saga_id, planeta_origen_id, nombre_personaje, especie, afiliacion_faccion, es_sensible_fuerza_psique) VALUES
(1, 1, 'Luke Skywalker', 'Humano', 'Alianza Rebelde', TRUE),
(1, 1, 'Anakin Skywalker', 'Humano', 'Imperio Galáctico', TRUE),
(1, 2, 'Leia Organa', 'Humano', 'Alianza Rebelde', TRUE),
(2, 3, 'Paul Atreides', 'Humano', 'Casa Atreides', TRUE),
(2, 4, 'Leto Atreides I', 'Humano', 'Casa Atreides', FALSE),
(3, 5, 'Spock', 'Vulcano / Humano', 'Flota Estelar', FALSE);