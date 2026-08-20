use paracaidismo_db;

insert into equipos_paracaidas (numero_serie, modelo_equipo, estado_equipo, saltos_acumulados) values
('eq-storm-001', 'vector iv master', 'disponible', 45),
('eq-sky-002', 'sigma tandem rig', 'disponible', 120),
('eq-apex-003', 'mirage g4 sport', 'disponible', 85),
('eq-velocity-004', 'infinity container', 'disponible', 15),
('eq-fusion-005', 'icon core rig', 'en mantenimiento', 95),
('eq-vanguard-006', 'micron swift', 'disponible', 30),
('eq-phoenix-007', 'eclipse container', 'disponible', 60),
('eq-titan-008', 'sunpath javelin', 'disponible', 110);

insert into saltos_paracaidismo (paracaidista_nombre, id_equipo, altura_salto_pies, instructor_encargado, estado_salto, fecha_salto) values
('carlos mendoza', 1, 14000, 'maverick vance', 'completado', '2026-06-10 09:30:00'),
('angela arrivillaga', 2, 15000, 'goose bradshaw', 'completado', '2026-06-12 11:00:00'),
('iker dahinten', 3, 12000, 'iceman kazansky', 'programado', '2026-09-01 14:15:00'),
('allison vargas', 4, 13500, 'maverick vance', 'programado', '2026-09-05 10:00:00'),
('cleidy mosquera', 6, 14500, 'goose bradshaw', 'completado', '2026-07-20 15:45:00'),
('anderson perez', 7, 15000, 'iceman kazansky', 'programado', '2026-09-10 08:30:00'),
('evelin romero', 8, 12500, 'maverick vance', 'completado', '2026-08-01 12:00:00'),
('sam drake', 1, 14000, 'goose bradshaw', 'programado', '2026-09-15 16:00:00');

-- creacion de triggers en mysql para automatizar reglas de negocio e integridad en tiempo real

drop trigger if exists trg_despues_insertar_salto;
drop trigger if exists trg_antes_actualizar_salto;

delimiter $$

-- trigger 1 (after insert): incrementa automáticamente el contador de saltos acumulados del equipo y cambia su estado a 'en salto' si el salto está en curso o programado
create trigger trg_despues_insertar_salto
after insert on saltos_paracaidismo
for each row
begin
    if new.estado_salto = 'completado' then
        update equipos_paracaidas
        set saltos_acumulados = saltos_acumulados + 1,
            estado_equipo = 'disponible'
        where id_equipo = new.id_equipo;
        
        -- registrar en bitácora
        insert into bitacora_mantenimiento_equipos (id_equipo, descripcion_evento)
        values (new.id_equipo, concat('salto completado exitosamente. equipo incrementó contador de saltos.'));
    elseif new.estado_salto = 'programado' then
        update equipos_paracaidas
        set estado_equipo = 'en salto'
        where id_equipo = new.id_equipo;
    end if;
end $$

-- trigger 2 (before update): valida cambios de estado en los saltos y registra eventos en la bitácora si el salto pasa a completado
create trigger trg_antes_actualizar_salto
before update on saltos_paracaidismo
for each row
begin
    if old.estado_salto != 'completado' and new.estado_salto = 'completado' then
        -- al completarse, libera el equipo y suma un salto
        set new.fecha_salto = current_timestamp();
    end if;
end $$

delimiter ;