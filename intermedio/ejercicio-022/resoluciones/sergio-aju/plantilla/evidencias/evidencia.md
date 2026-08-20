# Ejercicio 022 - Normalización (2FN) para Animación 3D

Solución estructurada bajo los principios de normalización de bases de datos relacionales (2FN) utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, separación de la entidad `categorias_animacion` y la tabla relacional `proyectos_animacion`.
- `dml/inserts.sql`: Inserción de datos maestros de categorías y 8 registros realistas de proyectos.
- `dql/consultas.sql`: Consultas avanzadas utilizando `JOIN`, `GROUP BY`, `ORDER BY` y filtros de negocio.

## Ejecución
1. Ejecutar el script `schema.sql` para levantar la estructura relacional.
2. Ejecutar el script `inserts.sql` para poblar las tablas con datos de prueba.
3. Ejecutar el script `consultas.sql` para verificar los reportes e indicadores.

## Decisiones Técnicas
- Se aplicó normalización separando las categorías en una tabla independiente (`categorias_animacion`) para evitar la redundancia de cadenas de texto y asegurar la integridad referencial mediante claves foráneas (`FOREIGN KEY`).
- Se mantuvo el uso de `DECIMAL(10,2)` para los puntajes y restricciones con `ENUM` para los estados de los proyectos.