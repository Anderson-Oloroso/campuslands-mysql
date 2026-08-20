# Ejercicio 023 - Normalización 3FN para Arquitectura 3D

Solución normalizada para gestionar proyectos de arquitectura, clientes y categorías en `campuslands_mysql`.

## Estructura
- `schema.sql`: Estructura en 3FN eliminando dependencias transitivas (separando clientes y categorías).
- `inserts.sql`: Datos maestros y registros transaccionales.
- `consultas.sql`: Consultas analíticas utilizando `JOIN` para reconstruir la información normalizada.

## Decisiones Técnicas
- **3FN**: Se descompuso la información en tres tablas (`proyectos`, `clientes`, `categorias`) para asegurar que cada atributo no clave dependa únicamente de la clave primaria, evitando redundancias.
- **Integridad**: Uso de `FOREIGN KEY` para garantizar que no existan proyectos huérfanos sin cliente o categoría.
- **Escalabilidad**: Esta estructura permite añadir nuevos clientes o categorías sin modificar la tabla de proyectos, facilitando el mantenimiento.