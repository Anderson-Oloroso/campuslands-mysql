# Ejercicio 011 - CHECK para pingpong

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

Se diseñó una tabla llamada `jugadores` para almacenar la información principal de los competidores de pingpong. El enfoque del ejercicio es demostrar el uso de restricciones `CHECK`, por lo que se validan la edad, el ranking, las victorias, las derrotas y el porcentaje de victorias. Además, se emplean `PRIMARY KEY`, `UNIQUE`, `DEFAULT` y `ENUM` para garantizar la integridad de los datos y permitir la generación de reportes mediante consultas SQL.