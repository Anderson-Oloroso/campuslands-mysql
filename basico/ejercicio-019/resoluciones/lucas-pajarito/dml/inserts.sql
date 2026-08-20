USE basico_paracaidismo;

-- =============================================================================
-- VARIANTE 1: INSERT Múltiple (Carga de instructores)
-- =============================================================================
INSERT INTO instructores_019 (nombre, licencia_faa, saltos_acumulados) VALUES
('Carlos Mendoza', 'D-38912', 1500),
('Andrea López', 'D-41205', 2300),
('Fernando Gómez', 'C-19820', 850);


-- =============================================================================
-- VARIANTE 2: INSERT con Columnas Explícitas y Uso de Defaults
-- =============================================================================
-- En el primer registro se especifica nivel y fecha explícitamente
INSERT INTO paracaidistas_019 (nombre, correo, nivel_experiencia, fecha_registro)
VALUES ('Lucas Pajarito', 'lucas.pajarito@email.com', 'Licenciado', '2026-01-10');

-- En las siguientes inserciones se omiten nivel_experiencia y/o fecha_registro para activar DEFAULT
INSERT INTO paracaidistas_019 (nombre, correo) 
VALUES ('Mariana Estrada', 'mariana.estrada@email.com');

INSERT INTO paracaidistas_019 (nombre, correo, nivel_experiencia) 
VALUES ('Mateo Morales', 'mateo.morales@email.com', 'Estudiante');

INSERT INTO paracaidistas_019 (nombre, correo, nivel_experiencia) 
VALUES ('Sofia Ruiz', 'sofia.ruiz@email.com', 'Licenciado');


-- =============================================================================
-- VARIANTE 3: INSERT Múltiple Transaccional (Registro de saltos)
-- =============================================================================
INSERT INTO saltos_019 (paracaidista_id, instructor_id, altitud_pies, monto_pago, fecha_salto) VALUES
(1, 1, 14000, 350.00, '2026-08-01 09:30:00'),
(2, 2, 10000, 220.00, '2026-08-03 11:15:00'),
(3, 3, 12000, 280.00, '2026-08-05 14:00:00'),
(4, 1, 15000, 400.00, '2026-08-10 10:45:00'),
(1, 2, 14000, 350.00, '2026-08-12 16:20:00');


-- =============================================================================
-- VARIANTE 4: INSERT INTO ... SELECT (Migración/Respaldo masivo)
-- Copia a una tabla secundaria únicamente los saltos de mayor altitud (>= 14,000 pies)
-- =============================================================================
INSERT INTO bitacora_saltos_vip_019 (salto_id, nombre_paracaidista, altitud_pies, monto_pago)
SELECT 
    s.id,
    p.nombre,
    s.altitud_pies,
    s.monto_pago
FROM saltos_019 s
JOIN paracaidistas_019 p ON s.paracaidista_id = p.id
WHERE s.altitud_pies >= 14000;