-- DML: Registro de personajes icónicos de sagas de ciencia ficción
USE campuslands_mysql;

INSERT INTO personajes_scifi (nombre, faccion, rol, nivel_poder, estado, planeta_origen) VALUES
('Luke Skywalker', 'Alianza Rebelde', 'Maestro Jedi', 95, 'activo', 'Tatooine'),
('Darth Vader', 'Imperio Galáctico', 'Lord Sith', 98, 'caido_en_combate', 'Tatooine'),
('Spock', 'Flota Estelar', 'Oficial Científico', 85, 'retirado', 'Vulcano'),
('Jean-Luc Picard', 'Flota Estelar', 'Capitán', 88, 'activo', 'Tierra'),
('Paul Atreides', 'Casa Atreides', 'Líder / MuadDib', 96, 'activo', 'Caladan'),
('Ellen Ripley', 'Corporación Weyland-Yutani', 'Teniente / Suboficial', 80, 'activo', 'Tierra'),
('Neo', 'Resistencia Humana', 'El Elegido', 99, 'activo', 'Matrix Central'),
('Master Chief', 'UNSC', 'Spartan-117', 92, 'activo', 'Eridanus II');
