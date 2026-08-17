# Ejercicio 015 - Relaciones Simples para Biblioteca Gamer

## Autor
Sergio Miranda

## Descripción
Modelado de datos relacional en MySQL para una biblioteca de videojuegos, implementando una relación de uno a muchos (1:N) entre las entidades `plataformas` y `juegos`.

## Orden de Ejecución
1. Ejecutar el script `ddl/schema.sql` para crear la base de datos, las tablas y la clave foránea.
2. Ejecutar el script `dml/inserts.sql` para poblar las plataformas y los juegos correspondientes.
3. Ejecutar las consultas relacionales y reportes en `dql/consultas.sql`.

## Decisiones Técnicas
- Se separó la información en dos tablas (`plataformas` y `juegos`) para evitar la redundancia de texto y aplicar normalización básica.
- Se agregó una restricción `FOREIGN KEY` con `ON DELETE CASCADE` para mantener la integridad referencial.
- Se utilizó el tipo de dato `DECIMAL` para asegurar precisión en los precios de los videojuegos.