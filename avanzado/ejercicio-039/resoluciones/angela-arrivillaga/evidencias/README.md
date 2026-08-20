# ejercicio 039 - bloqueos para kickboxing

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

1. ejecutar ddl/schema.sql (creacion de tablas relacionales con restricciones y validaciones de negocio).
2. ejecutar dml/inserts.sql (carga registros realistas e implementa bloques transaccionales con uso de bloqueos explícitos `FOR UPDATE` y `LOCK IN SHARE MODE`).
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* aplicacion de bloqueos explícitos (`SELECT ... FOR UPDATE` y `LOCK IN SHARE MODE`) dentro del flujo DML para garantizar la atomicidad y evitar condiciones de carrera (race conditions) al modificar salarios o bolsas de combate concurrentes.
* modelado relacional riguroso de 1:N entre combatientes y eventos de combate.
* uso de tipos `DECIMAL` para garantizar precisión financiera estricta en las bolsas monetarias y premios de los atletas.
* empleo de restricciones `CHECK` para prevenir valores negativos en estadísticas de peleas y montos de premios.

## salida y resultados esperados

* control concurrente seguro durante las transacciones financieras y de emparejamiento de peleadores.
* reportes analíticos consolidados de rendimiento y costos por categoría de peso.

---

# evidencias

* se validó el comportamiento de los bloqueos exclusivos previniendo modificaciones concurrentes en las filas afectadas durante la transacción.
* se comprobó la integridad referencial y el funcionamiento correcto de las consultas analíticas DQL.