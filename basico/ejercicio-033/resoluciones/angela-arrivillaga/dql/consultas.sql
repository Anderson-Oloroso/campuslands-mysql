create database if not exists inventario_skins_shooter_db;
use inventario_skins_shooter_db;

create table rareza_skin (
    id_rareza int primary key auto_increment,
    nombre_rareza varchar(30) not null unique,
    factor_multiplicador decimal(4,2) not null,
    constraint chk_multiplicador check (factor_multiplicador >= 1.00)
);use inventario_skins_shooter_db;

-- listado completo de skins ordenadas de mayor a menor precio en el mercado
select s.nombre_skin, s.arma_asociada, r.nombre_rareza, s.precio_mercado, s.desgaste_nivel, s.estado_disponibilidad
from skins_shooter s
join rareza_skin r on s.id_rareza = r.id_rareza
order by s.precio_mercado desc;

-- consulta de skins disponibles clasificadas como legendarias o epicas
select s.nombre_skin, s.arma_asociada, r.nombre_rareza, s.precio_mercado
from skins_shooter s
join rareza_skin r on s.id_rareza = r.id_rareza
where r.nombre_rareza in ('legendaria', 'epica') and s.estado_disponibilidad = 'disponible'
order by s.precio_mercado desc;

-- resumen estadistico de valor total e inventario agrupado por nivel de rareza
select 
    r.nombre_rareza,
    count(s.id_skin) as total_skins,
    round(avg(s.precio_mercado), 2) as precio_promedio,
    sum(s.precio_mercado) as valor_acumulado_mercado
from rareza_skin r
left join skins_shooter s on r.id_rareza = s.id_rareza
group by r.id_rareza, r.nombre_rareza
order by valor_acumulado_mercado desc;

-- top cinco de skins mas caras registradas en el inventario del juego
select s.nombre_skin, s.arma_asociada, r.nombre_rareza, s.precio_mercado, s.desgaste_nivel
from skins_shooter s
join rareza_skin r on s.id_rareza = r.id_rareza
order by s.precio_mercado desc
limit 5;

-- reporte de skins filtradas por desgaste en condicion factory new
select s.nombre_skin, s.arma_asociada, r.nombre_rareza, s.precio_mercado, s.fecha_lanzamiento
from skins_shooter s
join rareza_skin r on s.id_rareza = r.id_rareza
where s.desgaste_nivel = 'factory new'
order by s.fecha_lanzamiento asc;

create table skins_shooter (
    id_skin int primary key auto_increment,
    nombre_skin varchar(50) not null unique,
    arma_asociada varchar(40) not null,
    id_rareza int not null,
    precio_mercado decimal(10,2) not null,
    desgaste_nivel enum('factory new', 'minimal wear', 'field-tested', 'well-worn', 'battle-scarred') not null,
    fecha_lanzamiento date not null,
    estado_disponibilidad enum('disponible', 'agotado', 'exclusivo') default 'disponible',
    constraint fk_skin_rareza foreign key (id_rareza) references rareza_skin(id_rareza) on delete restrict on update cascade,
    constraint chk_precio_skin check (precio_mercado >= 0.00)
);