# Solución Ejercicio 016 - Restaurante de Comida Urbana

## Descripción
Esta solución implementa la estructura DDL, carga de datos DML y reportes DQL para el módulo de datos de un restaurante de comida urbana (*Street Food*).

## Decisiones Técnicas
1. **Ajuste de Tipos de Datos**:
   - `precio DECIMAL(10,2)`: Permite almacenar importes monetarios con precisión exacta.
   - `puntaje DECIMAL(3,2)`: Ajustado para escalar calificaciones de clientes en rango de `0.00` a `5.00`.
2. **Restricciones de Integridad**:
   - `CHECK (puntaje BETWEEN 0.00 AND 5.00)` evita registros con puntuaciones fuera de rango.
   - `CHECK (precio >= 0.00)` previene valores negativos.
3. **Casos Límite Probados**:
   - Productos en estado `revision` e `inactivo`.
   - Productos con calificaciones bajas para auditar la calidad del menú.
   - Rango variado de precios para pruebas de filtros.

## Orden de Ejecución
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`