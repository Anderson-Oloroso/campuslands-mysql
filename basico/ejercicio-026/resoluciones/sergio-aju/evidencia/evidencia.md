# Ejercicio 026 - Validaciones Simples para Videojuego RPG

Solución de nivel básico enfocada en la implementación de validaciones simples y restricciones de integridad (`CHECK` constraints, tipos `ENUM` y `DECIMAL`) en MySQL, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `personajes_rpg` con validaciones estructuradas para asegurar que el nivel y la experiencia no posean valores inválidos (negativos o menores al nivel mínimo).
- `dml/inserts.sql`: Inserción inicial de 8 registros normalizados con datos coherentes del contexto de un videojuego RPG.
- `dql/consultas.sql`: Consultas analíticas de negocio con funciones de agregación (`COUNT`, `AVG`, `SUM`), filtros por estados y ordenamientos avanzados.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura de la base de datos y las restricciones de validación.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar los reportes analíticos del sistema RPG.

## Decisiones Técnicas
- **Validaciones Simples**: Se integraron restricciones `CHECK` para garantizar que el `nivel` sea mayor o igual a 1 y que la `experiencia` nunca sea menor a 0.
- **Tipificación Precisa**: Uso de `DECIMAL(10,2)` para el manejo exacto de los puntos de experiencia y campos `ENUM` para clasificar las clases y estados de los avatares.