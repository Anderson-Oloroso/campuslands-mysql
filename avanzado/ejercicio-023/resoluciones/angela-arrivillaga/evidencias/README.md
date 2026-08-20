# Ejercicio 023 - Roles y Permisos para Arquitectura 3D

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

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos relacional, las tablas normalizadas, las restricciones y la configuración de **roles y permisos (DCL)** en MySQL.
2. Ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de arquitectos, software CAD/BIM, proyectos arquitectónicos, componentes 3D y relaciones N:M.
3. Ejecutar el script `dql/consultas.sql` para auditar los privilegios de los roles y generar reportes financieros y de producción.

## Decisiones Técnicas

* Se diseñó el esquema relacional `arquitectura_3d_roles_db` enfocado en la gestión corporativa de proyectos arquitectónicos y modelado digital.
* **Gestión de Roles y Permisos (DCL):**
  - Se crearon tres roles especializados: `rol_arquitecto_senior` (CRUD completo en proyectos y componentes), `rol_render_artist` (permisos de consulta y actualización exclusiva del estado del render) y `rol_auditor_proyectos` (privilegios de solo lectura sobre todo el esquema).
  - Se implementaron sentencias `GRANT` y `FLUSH PRIVILEGES` siguiendo el principio de mínimo privilegio.
* Se estructuraron 5 consultas DQL orientadas a la auditoría de seguridad en `mysql.user` y reportes analíticos de inversión, superficies y componentes 3D.

## Salida y Resultados Esperados

* Base de datos robusta con integridad referencial estricta y validaciones a nivel de columnas (`CHECK`).
* Asignación correcta de roles y permisos a nivel de motor MySQL.
* Consultas verificadas que demuestran la capacidad de auditar la seguridad y consultar indicadores de negocio.