use campuslands_mysql;

-- insercion de combatientes de kickboxing
insert into combatientes (nombre, categoria_peso, peleas_ganadas, peleas_perdidas, bolsa_pelea, estado) values
('rico verhoeven', 'peso pesado', 62, 10, 45000.00, 'activo'),
('antonio plazibat', 'peso pesado', 22, 5, 28000.00, 'activo'),
('giorgio Petrosyan', 'peso ligero', 104, 3, 50000.00, 'activo'),
('superbon singha mawynn', 'peso pluma', 115, 35, 42000.00, 'activo'),
('alex pereira', 'peso semipesado', 33, 7, 38000.00, 'activo'),
('artur kyshenko', 'peso mediano', 75, 12, 30000.00, 'activo'),
('tariq osaro', 'peso pesado', 25, 4, 20000.00, 'lesionado'),
('buakaw banchamek', 'peso ligero', 240, 24, 48000.00, 'activo');

-- demostracion de bloqueos explicitos mediante transacciones concurrentes
start transaction;

-- bloqueo exclusivo para lectura y actualizacion de bolsa en la tabla combatientes (select ... for update)
select id, nombre, bolsa_pelea from combatientes 
where id = 1 for update;

-- actualizacion segura de la bolsa del peleador bajo bloqueo
update combatientes 
set bolsa_pelea = bolsa_pelea + 5000.00 
where id = 1;

-- insercion de evento vinculado con bloqueo compartido preventivo (lock in share mode)
select id, nombre, estado from combatientes 
where id = 2 lock in share mode;

insert into eventos_combate (combatiente_rojo_id, combatiente_azul_id, modalidad, premio_total, estado_evento) 
values (1, 2, 'k-1 rules', 73000.00, 'programado');

-- confirmacion de la transaccion liberando los bloqueos
commit;