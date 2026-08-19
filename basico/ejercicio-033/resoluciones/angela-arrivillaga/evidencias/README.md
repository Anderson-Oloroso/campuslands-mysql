# ejercicio 033 - primary key para inventario de skins shooter

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos `inventario_skins_shooter_db`.
* aplicacion estricta de restricciones `PRIMARY KEY` en las entidades principales (`id_rareza` e `id_skin`) junto con claves foráneas para mantener la integridad referencial.
* uso de tipos de datos adecuados como `DECIMAL` para el control preciso de los precios de mercado y `ENUM` para los niveles de desgaste y estados de disponibilidad.

## salida y resultados esperados

* listado general de skins ordenadas por valor comercial descendente.
* filtrado de skins de alta rareza disponibles en la tienda.
* resumen estadístico de precios promedio y valor acumulado por categoría de rareza.
* top 5 de las skins más costosas del shooter.
* reporte específico de skins en estado de desgaste óptimo (`factory new`).

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño relacional limpio con llaves primarias autoincrementales y restricciones de dominio.
* dml: inserción de registros variados que simulan un ecosistema real de cosméticos de videojuegos.
* dql: consultas analíticas optimizadas con funciones de agregación, uniones y ordenamiento profesional.