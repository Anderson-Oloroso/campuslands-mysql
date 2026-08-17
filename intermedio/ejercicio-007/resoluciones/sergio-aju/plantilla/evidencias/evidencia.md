# Ejercicio 007: Normalización 2FN - Liga de Fútbol

## Decisiones Técnicas
- **2FN Aplicada:** Se separaron las entidades en `equipos` y `jugadores`, eliminando redundancias y asegurando que los atributos de cada tabla dependan completamente de su llave primaria.
- **Restricciones:** Uso de `ENUM` para limitar estados y posiciones, y `UNSIGNED` para evitar valores negativos en goles.

## Orden de Ejecución
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`