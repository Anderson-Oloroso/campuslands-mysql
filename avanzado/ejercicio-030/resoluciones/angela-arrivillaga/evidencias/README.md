# ejercicio 030 - optimizacion para equipo de streaming

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

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del inventario de streaming, tablas normalizadas, llaves foraneas, restricciones y los indices estrategicos de optimizacion.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de categorias, componentes de streaming, estados operativos, precios y fechas de adquisicion.
3. ejecutar el script `dql/consultas.sql` junto con el comando `explain analyze` para verificar la ejecucion optimizada de consultas analiticas, filtros avanzados, subconsultas y funciones de ventana.

## decisiones tecnicas

* se diseño el esquema relacional `equipo_streaming_db` optimizado para la gestion de hardware, perifericos y dispositivos de produccion de contenidos.
* **estrategia de optimizacion con indices:**
  - se implemento un indice en la columna de estado (`idx_equipos_estado`) para acelerar los filtros por disponibilidad operativa.
  - se creo un indice en la columna de precio (`idx_equipos_precio`) para optimizar los ordenamientos y rangos de costos.
  - se estructuro un indice compuesto (`idx_equipos_categoria_estado`) para agilizar las uniones (*joins*) y agrupaciones (*group by*) cruzadas entre categorias y estados.
* uso de la herramienta `explain analyze` en todas las consultas dql del script para evaluar el rendimiento, planes de ejecucion y costos operativos en mysql.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos plenamente funcional con indices orientados al rendimiento y consultas de analisis financiero, control de inventario y ranking de equipos.
* planes de ejecucion validados que demuestran el aprovechamiento eficiente de los indices creados en el motor de mysql.