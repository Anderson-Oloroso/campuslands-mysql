use viajes_turismo_db;

insert into destinos_turisticos (nombre_destino, pais, costo_base_diario, nivel_popularidad) values
('kyoto cultural', 'japón', 150.00, 'alto'),
('machu picchu ancestral', 'perú', 90.00, 'alto'),
('islas griegas paradisíacas', 'grecia', 220.00, 'vip'),
('auroras boreales en tromsø', 'noruega', 250.00, 'vip'),
('playas de tulum', 'méxico', 120.00, 'alto'),
('patagonia argentina', 'argentina', 110.00, 'medio'),
('recorrido histórico roma', 'italia', 130.00, 'alto'),
('safari en serengeti', 'tanzania', 300.00, 'vip');

insert into paquetes_viaje (nombre_paquete, id_destino, duracion_dias, precio_paquete, cupos_disponibles, estado_paquete) values
('experiencia milenaria kyoto 7d', 1, 7, 1200.00, 15, 'disponible'),
('ruta inca imperial machu picchu 5d', 2, 5, 650.00, 20, 'disponible'),
('crucero azul en islas griegas 10d', 3, 10, 2500.00, 8, 'disponible'),
('cacería de auroras boreales 6d', 4, 6, 1900.00, 10, 'disponible'),
('escapada caribeña tulum 4d', 5, 4, 550.00, 25, 'disponible'),
('aventura austral patagonia 8d', 6, 8, 1150.00, 12, 'disponible'),
('roma clásica y coliseo 5d', 7, 5, 800.00, 30, 'disponible'),
('safari salvaje serengeti 6d', 8, 6, 2800.00, 5, 'agotado');

-- creacion de funciones almacenadas (stored functions) en mysql para calculos logicos reutilizables

drop function if exists fn_calcular_costo_por_dia;
drop function if exists fn_calcular_descuento_paquete;

delimiter $$

-- funcion 1: calcula el costo promedio diario real de un paquete de viaje en base a su precio y duración en días
create function fn_calcular_costo_por_dia (
    p_precio decimal(10,2),
    p_duracion int
) 
returns decimal(10,2)
deterministic
begin
    if p_duracion <= 0 then
        return 0.00;
    else
        return round(p_precio / p_duracion, 2);
    end if;
end $$

-- funcion 2: calcula el valor de un descuento especial (ej: 10% si el precio supera los 2000 dólares, de lo contrario 5%)
create function fn_calcular_descuento_paquete (
    p_precio decimal(10,2)
) 
returns decimal(10,2)
deterministic
begin
    if p_precio >= 2000.00 then
        return round(p_precio * 0.15, 2); -- 15% de descuento vip
    elseif p_precio >= 1000.00 then
        return round(p_precio * 0.10, 2); -- 10% de descuento estandar
    else
        return round(p_precio * 0.05, 2); -- 5% de descuento basico
    end if;
end $$

delimiter ;