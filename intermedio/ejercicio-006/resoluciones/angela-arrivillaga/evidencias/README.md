Ejercicio 006 - normalizacion 1FN para autos hiperdeportivos

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
* Se aplicó la Primera Forma Normal (1FN) asegurando que cada columna contenga valores atómicos (indivisibles) y eliminando grupos repetitivos mediante la creación de la tabla relacionada `especificaciones_colores`.
* Se incorporaron 8 registros principales y 10 registros dependientes para probar relaciones y consultas con `JOIN`.
* Se implementaron restricciones `CHECK` y claves foráneas con eliminación en cascada (`ON DELETE CASCADE`).

Salida y resultados esperados
* Consulta 1: Muestra los hiperdeportivos disponibles que superan los 400 km/h.
* Consulta 2: Retorna el conteo total de vehículos agrupados por su estado de inventario.
* Consulta 3: Devuelve el podio de los 3 autos más costosos del catálogo.
* Consulta 4: Relaciona mediante `JOIN` los autos con sus respectivos colores atómicos almacenados en la tabla dependiente.
* Consulta 5: Agrupa y cuenta la cantidad de opciones de color disponibles por cada modelo de vehículo.

Evidencias de ejecución
- **DDL:** Creación exitosa de las tablas `autos_hiperdeportivos` y `especificaciones_colores` cumpliendo con la atomicidad de la 1FN.
- **DML:** Inserción de 8 registros base y registros relacionales de soporte.
- **DQL:** Verificación correcta de filtros, funciones de agregación y uniones relacionales.