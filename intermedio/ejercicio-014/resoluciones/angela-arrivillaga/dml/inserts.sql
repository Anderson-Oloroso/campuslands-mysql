USE sci_fi_saga_db;

INSERT INTO facciones_estelares (nombre_faccion, lider_faccion, sistema_origen) VALUES
('Alianza Rebelde Galáctica', 'General Jyn Erso', 'Sistema Yavin'),
('Imperio Neon Cyber', 'Imperator Valakor', 'Sector Corellia'),
('Sindicato de Mercenarios Outer Rim', 'Capitana Vex', 'Nebulosa de Orion'),
('Federación Científica Nexus', 'Dra. Aris Thorne', 'Estación Alfa Centauri');

INSERT INTO misiones_espaciales (codigo_mision, nombre_mision, id_faccion, nivel_peligrosidad, duracion_meses, estado_mision) VALUES
('MSN-301', 'Infiltración en Base Orbital X', 1, 8, 12, 'en_curso'),
('MSN-302', 'Bloqueo de Rutas Comerciales Hyper', 2, 6, 8, 'completada'),
('MSN-303', 'Extracción de Datos en Cúmulo Oscuro', 3, 9, 15, 'planificada'),
('MSN-304', 'Exploración de Antecámara Cuántica', 4, 4, 6, 'completada'),
('MSN-305', 'Sabotaje a Red de Comunicaciones Imperiales', 1, 10, 18, 'planificada'),
('MSN-306', 'Patrullaje de Frontera Sector 7', 2, 5, 10, 'en_curso'),
('MSN-307', 'Caza de Recompensas en Cinturón de Asteroides', 3, 7, 9, 'completada'),
('MSN-308', 'Mapeo de Nebulosa Desconocida', 4, 3, 14, 'planificada');