# Ejercicio 022 - Vistas Avanzadas para Animación 3D

## Estructura del Proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## Ejecución

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos relacional, las tablas normalizadas, las restricciones y las **vistas avanzadas**.
2. Ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de animadores, software 3D, proyectos, assets y relaciones N:M.
3. Ejecutar el script `dql/consultas.sql` para comprobar el funcionamiento, reutilización y optimización de las consultas mediante las vistas creadas.

## Decisiones Técnicas

* Se diseñó el esquema relacional `animacion_3d_vistas_db` especializado en la gestión de proyectos de animación 3D y renderizado.
* **Creación de Vistas Avanzadas:**
  - `vw_rendimiento_animadores`: Agrega métricas financieras y de conteo de frames producidos por cada animador.
  - `vw_detalle_proyectos_activos`: Simplifica uniones complejas (`JOIN`) entre proyectos, animadores y software, filtrando estados activos o completados y calculando la duración en segundos en tiempo de ejecución.
  - `vw_complejidad_proyectos_assets`: Consolida el conteo total de polígonos por escena calculando las instancias de cada asset asociado a un proyecto.
* Se estructuraron 5 consultas DQL analíticas que explotan el potencial de las vistas relacionales para reportes de negocio, filtrados avanzados y rankings del Top 3.

## Salida y Resultados Esperados

* Base de datos robusta con integridad referencial estricta y validaciones a nivel de columnas (`CHECK`, `ENUM`).
* Inserción exitosa de datos coherentes con la temática de animación 3D.
* Consultas verificadas que demuestran la abstracción y limpieza de código SQL mediante vistas avanzadas.