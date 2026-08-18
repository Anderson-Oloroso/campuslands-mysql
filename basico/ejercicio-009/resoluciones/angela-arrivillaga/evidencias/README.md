Ejercicio 009 - DELETE controlado para kickboxing

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
* Se creó la tabla peleadores_kickboxing con restricciones CHECK para asegurar que las estadísticas de victorias y derrotas no sean negativas.
* Se incorporaron 8 registros iniciales con diferentes estados y categorías para poner a prueba las operaciones de eliminación controlada.
* Se implementaron sentencias DELETE con filtros estrictos mediante WHERE para simular la limpieza de registros (depuración de atletas retirados o suspendidos), seguidas de consultas analíticas DQL.

Salida y resultados esperados
* Sentencias DELETE: Remueven de forma segura los registros que cumplen con las condiciones de baja (retirados o suspendidos bajo criterio específico).
* Consulta 1: Muestra los atletas restantes ordenados de mayor a menor según sus victorias.
* Consulta 2: Retorna el conteo de peleadores agrupados por categoría de peso.
* Consulta 3: Presenta el podio con los 3 peleadores más victoriosos tras la depuración.
* Consulta 4: Calcula el promedio global de victorias de los peleadores vigentes.
* Consulta 5: Filtra peleadores activos con más de 20 victorias ordenándolos por su historial de derrotas.

Evidencias - Ejercicio 009

Este archivo documenta las validaciones realizadas:
* Ejecución del DDL: Verificación de la creación correcta de la tabla peleadores_kickboxing y sus validaciones CHECK.
* Inserción de datos: Comprobación de que los 8 registros iniciales se cargaron de manera exitosa en el sistema.
* Ejecución de DELETEs: Validación de que las eliminaciones se realizaron de forma controlada mediante filtros WHERE precisos, evitando borrados masivos accidentales.
* Ejecución de consultas: Confirmación de que las sentencias DQL reflejan correctamente el estado actualizado de la base de datos tras las operaciones de mantenimiento.