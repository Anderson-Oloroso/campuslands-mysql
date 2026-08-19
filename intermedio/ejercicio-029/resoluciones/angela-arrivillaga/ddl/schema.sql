create database if not exists marketplace_accesorios_db;
use marketplace_accesorios_db;

create table categorias (
    id_categoria int primary key auto_increment,
    nombre_categoria varchar(50) not null unique,
    descripcion varchar(150)
);

create table accesorios (
    id_accesorio int primary key auto_increment,
    codigo_sku varchar(20) not null unique,
    nombre_accesorio varchar(100) not null,
    id_categoria int not null,
    precio decimal(10,2) not null,
    stock int not null,
    estado_accesorio enum('disponible', 'agotado', 'descontinuado') default 'disponible',
    constraint fk_accesorio_categoria foreign key (id_categoria) references categorias(id_categoria) on delete restrict on update cascade,
    constraint chk_precio_accesorio check (precio >= 0.00),
    constraint chk_stock_accesorio check (stock >= 0)
);

create view vw_accesorios_disponibles as
select 
    a.codigo_sku,
    a.nombre_accesorio,
    c.nombre_categoria,
    a.precio,
    a.stock
from accesorios a
join categorias c on a.id_categoria = c.id_categoria
where a.estado_accesorio = 'disponible';

create view vw_resumen_inventario_categorias as
select 
    c.nombre_categoria,
    count(a.id_accesorio) as total_productos,
    sum(a.stock) as stock_total,
    round(avg(a.precio), 2) as precio_promedio
from categorias c
left join accesorios a on c.id_categoria = a.id_categoria
group by c.id_categoria, c.nombre_categoria;