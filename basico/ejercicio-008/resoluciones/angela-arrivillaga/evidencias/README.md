Ejercicio 008 - UPDATE para futbol sala

Estructura del proyecto
angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

Ejecución
1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

Decisiones técnicas
* Se utilizó la base de datos campuslands_mysql.
* Se creó la tabla jugadores_sala con restricciones CHECK para evitar valores negativos en goles y tarjetas.
* Se incorporaron 8 registros con perfiles diversos (posiciones, estados y estadísticas).
* Se integraron sentencias UPDATE dentro del flujo de trabajo para demostrar modificaciones de registros (actualización de estados y estadísticas en caliente), complementadas con consultas DQL para verificar los cambios.

Salida y resultados esperados
* Sentencias UPDATE: Modifican correctamente la base de datos (reactivación de jugadores, incremento de goles y suspensiones automáticas).
* Consulta 1: Muestra el listado de jugadores ordenados de mayor a menor según sus anotaciones.
* Consulta 2: Retorna un resumen con el conteo de jugadores por cada estado.
* Consulta 3: Presenta el podio de los 3 máximos goleadores del torneo.
* Consulta 4: Calcula el promedio de goles de los deportistas que se encuentran activos.
* Consulta 5: Filtra jugadores activos o suspendidos que poseen amonestaciones, ordenándolos descendentemente.

Evidencias - Ejercicio 008

Este archivo documenta las validaciones realizadas:
* Ejecución del DDL: Verificación de la correcta creación de la tabla jugadores_sala y sus restricciones en MySQL.
* Inserción de datos: Comprobación de la inserción exitosa de los 8 registros iniciales.
* Ejecución de UPDATEs: Validación de que las modificaciones sobre los estados, acumulación de goles y sanciones por tarjetas se aplican correctamente mediante la cláusula WHERE.
* Ejecución de consultas: Confirmación de que las sentencias DQL reflejan de manera precisa los datos actualizados, mostrando reportes coherentes.