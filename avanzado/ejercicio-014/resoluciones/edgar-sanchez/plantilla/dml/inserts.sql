INSERT INTO facciones_saga (nombre_faccion, planeta_origen, nivel_tecnologico) VALUES
('Federación Estelar', 'Terra Prime', 8),
('Alianza de Sistemas Libres', 'Krypton-X', 7),
('Imperio Andrómeda', 'Aethelgard', 9);

INSERT INTO naves_espaciales (faccion_id, codigo_nave, nombre_nave, clase, capacidad_carga_ton, estado_nave) VALUES
(1, 'NAV-FED-001', 'Enterprise Nova', 'Crucero Pesado', 15000.00, 'Operativa'),
(1, 'NAV-FED-002', 'Astraea', 'Carguero Ligero', 5000.00, 'Operativa'),
(2, 'NAV-ALI-001', 'Falcon V', 'Caza Espacial', 250.00, 'En Misión'),
(3, 'NAV-IMP-001', 'Anubis II', 'Acorazado', 35000.00, 'Operativa'),
(3, 'NAV-IMP-002', 'Valkiria IX', 'Explorador', 1200.00, 'En Mantenimiento');

INSERT INTO misiones_espaciales (nave_id, nombre_mision, sistema_estelar, prioridad, duracion_estimada_horas, estado_mision, fecha_inicio) VALUES
(1, 'Exploración de la Nebulosa Orión', 'Sistema Alfa', 'Alta', 120, 'En Curso', '2026-08-10 08:00:00'),
(3, 'Patrulla Fronteriza Sector 7', 'Sistema Gamma', 'Media', 48, 'Completada', '2026-08-12 10:00:00'),
(2, 'Suministro de Antimateria', 'Sistema Sol', 'Crítica', 24, 'Pendiente', '2026-08-18 12:00:00'),
(4, 'Reconocimiento de Agujero de Gusano', 'Sistema Epsilon', 'Alta', 72, 'En Curso', '2026-08-15 14:00:00');

INSERT INTO recursos_estacion (nombre_recurso, cantidad_disponible, tasa_consumo_diaria, ultima_actualizacion) VALUES
('Cristales de Dilitio', 5000.00, 150.00, '2026-08-17 00:00:00'),
('Oxígeno Comprimido', 120000.00, 2500.00, '2026-08-17 00:00:00'),
('Plutonio Refinado', 850.00, 45.00, '2026-08-17 00:00:00');