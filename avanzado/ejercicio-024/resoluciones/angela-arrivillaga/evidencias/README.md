# Ejercicio 024 - Bloqueos para Soldadura

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

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos relacional, las tablas normalizadas, restricciones y validaciones de integridad.
2. Ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de soldadores certificados, equipos de soldadura, juntas y consumibles.
3. Ejecutar el script `dql/consultas.sql` para practicar mecanismos de **bloqueos de concurrencia** (`SELECT ... FOR UPDATE`, `LOCK IN SHARE MODE`) y generar reportes analíticos de producción y soldadura.

## Decisiones Técnicas

* Se diseñó el esquema relacional `soldadura_bloqueos_db` enfocado en el control industrial de procesos de soldadura y gestión de inventarios críticos.
* **Mecanismos de Bloqueos (Concurrency Control):**
  - Se implementó `SELECT ... FOR UPDATE` dentro de una transacción (`START TRANSACTION` / `COMMIT`) para asegurar el bloqueo exclusivo de filas al actualizar inspecciones de juntas pendientes, evitando condiciones de carrera en entornos multiusuario concurrentes.
  - Se implementó `LOCK IN SHARE MODE` (`FOR SHARE`) para proteger lecturas críticas de inventarios de consumibles durante auditorías de stock.
* Se estructuraron 5 consultas DQL orientadas a transacciones seguras, estadísticas de aprobación por soldador, análisis de consumo por proceso y un ranking de espesores máximos soldados.

## Salida y Resultados Esperados

* Base de datos robusta con soporte para transacciones seguras y control de concurrencia avanzado.
* Inserción exitosa de datos coherentes con la temática industrial de soldadura.
* Scripts SQL listos para validación profesional de bloqueos en MySQL.