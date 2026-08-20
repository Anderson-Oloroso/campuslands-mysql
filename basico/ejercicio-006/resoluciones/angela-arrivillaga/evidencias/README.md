Ejercicio 006 - WHERE para autos hiperdeportivos

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
* Se creó la tabla autos_hiperdeportivos con validación de velocidad mínima.
* Se implementaron 8 registros que permiten probar estados y rangos de precios.
* Uso de funciones de agregación (COUNT, AVG) y filtros avanzados (WHERE, IN, LIMIT).

Salida y resultados esperados
* Consulta 1: Muestra los hiperdeportivos disponibles que superan los 400 km/h.
* Consulta 2: Retorna el conteo total de vehículos agrupados por su estado actual.
* Consulta 3: Devuelve el podio de los 3 autos más costosos del catálogo.
* Consulta 4: Calcula el precio promedio de los modelos lanzados después del año 2020.
* Consulta 5: Lista únicamente los vehículos que se encuentran disponibles o reservados.

Evidencias - Ejercicio 006

Este archivo documenta las validaciones realizadas:
* Ejecución del DDL: Verificación de la creación correcta de la tabla y sus restricciones en MySQL.
* Inserción de datos: Comprobación de que los 8 registros se cargaron correctamente mediante la consulta de conteo total.
* Ejecución de consultas: Validación de que cada sentencia DQL responde al caso de negocio planteado sin arrojar errores.
* Resultados: Confirmación de que los filtros lógicos y agrupamientos operan de forma óptima sobre los tipos de datos definidos.