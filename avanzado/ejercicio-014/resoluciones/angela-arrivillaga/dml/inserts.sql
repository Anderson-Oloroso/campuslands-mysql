use saga_sci_fi_db;

insert into sectores_galaxia (nombre_sector, nivel_peligro) values
('sector alpha centauri', 'bajo'),
('nebulosa de orión', 'moderado'),
('frontera bismarck', 'critico'),
('sistema outer rim', 'critico');

insert into misiones_espaciales (nombre_mision, id_sector, comandante, presupuesto_creditos, nivel_exito_estimado, estado_mision, fecha_lanzamiento) values
('operación génesis', 1, 'comandante alexa vance', 1500000.00, 95.50, 'completada', '2026-01-15 08:00:00'),
('reconocimiento andrómeda', 2, 'capitán jack hilling', 2500000.00, 82.00, 'en curso', '2026-03-10 12:30:00'),
('exploración abisal', 3, 'coronel markus fenix', 5000000.00, 45.00, 'en curso', '2026-05-20 06:15:00'),
('colonia vanguardia', 1, 'comandante elena fisher', 3200000.00, 90.00, 'planificada', '2026-09-01 09:00:00'),
('vigilancia estelar', 4, 'capitán sam drake', 4100000.00, 60.50, 'planificada', '2026-10-12 14:00:00'),
('rescate horizon', 3, 'comandante t-800', 6000000.00, 30.00, 'en curso', '2026-02-01 10:00:00'),
('mapeo hiperespacio', 2, 'dra. clementine cruz', 1800000.00, 88.50, 'completada', '2026-04-05 16:45:00'),
('fortaleza omega', 4, 'coronel cortana', 7500000.00, 50.00, 'abortada', '2026-01-20 11:30:00');

-- configuracion y creacion del event scheduler en mysql para automatizar tareas periodicas de mantenimiento de misiones
set global event_scheduler = on;

drop event if exists evt_actualizar_misiones_vencidas;

delimiter $$

create event evt_actualizar_misiones_vencidas
on schedule every 1 day
starts current_timestamp
do
begin
    -- actualiza de manera automatica misiones en curso a completadas si su fecha de lanzamiento superó el umbral operativo
    update misiones_espaciales
    set estado_mision = 'completada'
    where estado_mision = 'en curso' 
      and fecha_lanzamiento < (current_date() - interval 180 day);

    -- registra la ejecucion automatica en la bitacora del sistema galactico
    insert into bitacora_eventos_scheduler (descripcion_evento, fecha_ejecucion)
    values ('ejecucion automatica: actualizacion de misiones espaciales vencidas', current_timestamp());
end $$

delimiter ;