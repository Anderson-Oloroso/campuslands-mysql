USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_014_flota (nave, faccion, estado, nivel_escudos) 
    VALUES ('Millennium Falcon', 'Rebelion', 'Operativa', 45),
    ('X-Wing Red 5', 'Rebelion', 'Operativa', 80),
    ('Star Destroyer Executor', 'Imperio', 'Operativa', 100),
    ('TIE Fighter Alpha', 'Imperio', 'Critica', 10),
    ('Slave I', 'Independiente', 'Operativa', 60),
    ('Y-Wing Gold Leader', 'Rebelion', 'Destruida', 0),
    ('TIE Interceptor Beta', 'Imperio', 'Operativa', 90);

-- Insertamos un registro manual en auditoria simulando un dia anterior
INSERT INTO avanzado_ejercicio_014_auditoria (naves_operativas, naves_criticas, fecha_registro) 
    VALUES (6, 0, DATE_SUB(NOW(), INTERVAL 1 DAY));