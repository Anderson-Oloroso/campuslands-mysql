USE soldadura_delete_db;

-- Insercion de 8 registros iniciales
INSERT INTO equipos_soldadura (codigo_equipo, modelo, tipo_proceso, horas_uso, costo_mantenimiento_usd, estado, fecha_ultimo_mantenimiento) VALUES
('EQ-SMAW-01', 'Miller Thunderolt 225', 'SMAW', 1200, 150.00, 'operativo', '2026-01-15'),
('EQ-GMAW-02', 'Lincoln Power MIG 210', 'GMAW', 3400, 450.00, 'obsoleto', '2024-05-10'),
('EQ-GTAW-03', 'ESAB Rebel TIG 205', 'GTAW', 850, 80.00, 'operativo', '2026-02-01'),
('EQ-FCAW-04', 'Hobart Handler 140', 'FCAW', 4200, 600.00, 'descartado', '2023-11-20'),
('EQ-SMAW-05', 'Kemppi MasterTig 235', 'SMAW', 2100, 310.00, 'en_mantenimiento', '2026-02-20'),
('EQ-GMAW-06', 'Fronius TransSteel 2200', 'GMAW', 5100, 750.00, 'obsoleto', '2024-08-14'),
('EQ-GTAW-07', 'Everlast PowerTIG 200', 'GTAW', 300, 40.00, 'operativo', '2026-03-01'),
('EQ-FCAW-08', 'Lincoln Idealarc 250', 'FCAW', 4800, 520.00, 'descartado', '2023-04-12');

-- Operaciones de DELETE Controlado (Practica central del ejercicio)
-- Delete 1: Eliminar equipos marcados como descartados que superen las 4000 horas de uso
DELETE FROM equipos_soldadura
WHERE estado = 'descartado' AND horas_uso > 4000;

-- Delete 2: Eliminar equipos obsoletos cuya ultima fecha de mantenimiento sea anterior a 2025
DELETE FROM equipos_soldadura
WHERE estado = 'obsoleto' AND fecha_ultimo_mantenimiento < '2025-01-01';
