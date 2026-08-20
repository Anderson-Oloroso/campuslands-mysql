# ejercicio 042 - consultas de reportes para playlist musical

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

1. ejecutar ddl/schema.sql (creacion de tablas relacionales con restricciones y tipos de datos normalizados).
2. ejecutar dml/inserts.sql (carga de registros de prueba realistas para playlists y canciones).
3. ejecutar dql/consultas.sql (ejecución de consultas de reportes y agregación de negocio).

## decisiones tecnicas

* modelado relacional riguroso 1:N entre la entidad `playlists` y la entidad `canciones`.
* uso de restricciones `CHECK` para garantizar que la duración de las canciones y el conteo de reproducciones mantengan valores positivos o cero de forma estricta.
* empleo de tipos de datos `BIGINT` para el conteo de reproducciones, previniendo desbordamientos ante alta popularidad de pistas musicales.
* uso de enumeraciones (`ENUM`) para administrar de forma limpia y controlada los estados operativos de cada pista.

## salida y resultados esperados

* reportes analíticos consolidados de rendimiento de reproducciones, duración acumulada y popularidad por lista de reproducción.
* consultas optimizadas mediante uniones (`JOIN`) y funciones de agregación profesional.

---

# evidencias

* se comprobó la ejecución exitosa de los scripts DDL y DML sin errores de integridad referencial.
* se validó que los reportes devuelven métricas analíticas exactas y ordenadas conforme a los requerimientos de negocio.