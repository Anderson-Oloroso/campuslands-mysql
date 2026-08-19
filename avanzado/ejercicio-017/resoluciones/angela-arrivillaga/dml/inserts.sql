use tienda_ropa_db;

insert into categorias_prendas (nombre_categoria, descripcion) values
('superiores', 'camisas, camisetas, blusas y hoodies'),
('inferiores', 'pantalones, jeans, shorts y faldas'),
('calzado', 'zapatillas, botas y zapatos casuales'),
('accesorios', 'gorras, cinturones y bolsos');

insert into inventario_prendas (nombre_prenda, id_categoria, talla, color, stock_actual, precio_dolares) values
('hoodie oversize aesthetic', 1, 'L', 'negro', 45, 39.99),
('camiseta basica coquette', 1, 'S', 'rosa pastel', 80, 18.50),
('jeans tiro alto wide leg', 2, 'M', 'azul claro', 60, 45.00),
('pantalón cargo urbano', 2, 'L', 'verde militar', 35, 48.00),
('zapatillas plataforma chunky', 3, '38', 'blanco', 25, 65.00),
('gorra deportiva minimalista', 4, 'UNICA', 'negro', 50, 15.00),
('bolso cruzado estético', 4, 'UNICA', 'beige', 30, 28.00),
('chaqueta denim vintage', 1, 'M', 'azul', 20, 55.00);

-- creacion y definicion de procedimientos almacenados (stored procedures) en mysql para gestionar logica de negocio avanzada

drop procedure if exists sp_registrar_venta_prenda;
drop procedure if exists sp_consultar_prendas_por_categoria;

delimiter $$

-- procedimiento almacenado 1: actualizar el stock de una prenda tras una venta y auditar el cambio
create procedure sp_registrar_venta_prenda (
    in p_id_prenda int,
    in p_cantidad_vendida int
)
begin
    declare v_stock_actual int;
    
    -- obtener el stock actual de la prenda
    select stock_actual into v_stock_actual
    from inventario_prendas
    where id_prenda = p_id_prenda;
    
    -- validar si hay suficiente stock disponible
    if v_stock_actual >= p_cantidad_vendida then
        -- registrar auditoria del cambio de stock
        insert into auditoria_stock (id_prenda, stock_anterior, stock_nuevo)
        values (p_id_prenda, v_stock_actual, v_stock_actual - p_cantidad_vendida);
        
        -- actualizar el stock en el inventario
        update inventario_prendas
        set stock_actual = stock_actual - p_cantidad_vendida
        where id_prenda = p_id_prenda;
        
        select 'venta registrada con exito y stock actualizado.' as mensaje;
    else
        signal sqlstate '45000' 
        set message_text = 'error: stock insuficiente para completar la venta.';
    end if;
end $$

-- procedimiento almacenado 2: consultar prendas filtradas por nombre de categoria con formato de reporte
create procedure sp_consultar_prendas_por_categoria (
    in p_nombre_categoria varchar(40)
)
begin
    select 
        p.nombre_prenda,
        c.nombre_categoria,
        p.talla,
        p.color,
        p.stock_actual,
        p.precio_dolares
    from inventario_prendas p
    join categorias_prendas c on p.id_categoria = c.id_categoria
    where c.nombre_categoria like concat('%', p_nombre_categoria, '%')
    order by p.precio_dolares desc;
end $$

delimiter ;

-- prueba de ejecucion del procedimiento almacenado de venta
call sp_registrar_venta_prenda(1, 3);