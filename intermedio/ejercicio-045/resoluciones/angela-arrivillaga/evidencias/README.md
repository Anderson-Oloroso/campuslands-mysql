# ejercicio 045 - carga de datos para biblioteca gamer

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* se normalizaron los datos mediante el uso de tablas `plataformas` y `juegos` para evitar redundancia.
* implementación de `CHECK` en `precio` y `puntaje_critica` para asegurar la calidad de los datos ingresados.
* uso de `ENUM` para el control de inventario (`estado_juego`).
* se emplearon funciones de agregación (`AVG`, `COUNT`) para generar reportes financieros y de calidad críticos para el negocio.

## evidencias de ejecucion
* se validó la carga exitosa de 8 registros iniciales distribuidos en las tablas.
* las consultas DQL verifican correctamente las métricas solicitadas, ofreciendo un reporte claro para la gestión de la biblioteca gamer.