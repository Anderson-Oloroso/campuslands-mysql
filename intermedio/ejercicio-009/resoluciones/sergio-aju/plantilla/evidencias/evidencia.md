# Resolución Ejercicio 009 - Kickboxing

## Descripción
Solución práctica al ejercicio de llaves foráneas (FOREIGN KEY) utilizando un modelo simple de kickboxing. El código está optimizado para ser directo y cumplir con todos los requerimientos técnicos.

## Cómo probarlo
Para levantar la base de datos y ver los resultados, ejecuta los archivos en el siguiente orden:

1. **`ddl/schema.sql`**: Crea la base de datos, la tabla `categorias` y la tabla `luchadores` (con su respectiva Foreign Key).
2. **`dml/inserts.sql`**: Registra 4 categorías y 8 luchadores para tener datos de prueba consistentes.
3. **`dql/consultas.sql`**: Ejecuta 5 reportes diferentes (filtros, JOINs, agrupaciones y promedios).

## Decisiones Técnicas
* Se usó `DECIMAL(5,2)` en los pesos para mantener precisión sin desperdiciar memoria.
* Se estructuraron las consultas y las inserciones en bloque para mantener los scripts limpios y cortos.