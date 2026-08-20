# Ejercicio 031 - transacciones para torneo esports MOBA

## Estructura del proyecto

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

1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql (incluye bloque transaccional START TRANSACTION, COMMIT).
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos campuslands_mysql.
* Se implementó un control transaccional explícito (`START TRANSACTION`, `COMMIT`) dentro del DML para simular la seguridad y atomicidad requerida en operaciones críticas como transferencias de jugadores y ajustes presupuestarios entre equipos.
* Se estructuró una relación de 1:N entre la tabla principal de equipos y el registro histórico de transferencias mediante claves foráneas.
* Se emplearon tipos `DECIMAL` para asegurar la precisión estricta en el manejo de premios monetarios y costos de transferencia.
* Se utilizaron restricciones `ENUM` y `CHECK` para garantizar la consistencia en los estados de los equipos y evitar valores negativos en puntajes o premios.

## Salida y resultados esperados

* El bloque transaccional asegura que las operaciones de traspaso y modificación de saldos se apliquen de forma íntegra o se reviertan ante cualquier fallo.
* El reporte por región calcula el ranking medio de los equipos activos.
* El top 3 identifica a las escuadras líderes del torneo MOBA.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar la correcta creación de las tablas de equipos y transferencias con sus respectivas restricciones y llaves foráneas.
* **Inserción y Transacciones:** Validar que los registros iniciales se carguen correctamente y que el bloque transaccional ejecute el traspaso de manera atómica.
* **Ejecución de las consultas:** Comprobar que los scripts DQL devuelvan los reportes analíticos, agregaciones y uniones (JOIN) sin errores.
* **Resultados importantes:** Validar la precisión de los cálculos de sumas de premios, promedios de ranking y la consistencia relacional del sistema.