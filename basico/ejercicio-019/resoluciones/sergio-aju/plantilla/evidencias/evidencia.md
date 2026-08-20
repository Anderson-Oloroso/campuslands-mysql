# Solución Ejercicio 019 (Básico) - Paracaidismo (INSERT)

## Descripción
Solución del ejercicio básico enfocado en la manipulación de datos con la sentencia `INSERT` para poblar una base de datos de servicios y ofertas de paracaidismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla `saltos_paracaidismo`.
2. Ejecuta `dml/inserts.sql` para insertar los datos de prueba.
3. Ejecuta `dql/consultas.sql` para comprobar los filtros y reportes.

---

## Evidencia de Resultados

### Consulta 2: Promedio de precios por nivel de experiencia
| nivel_experiencia | total_saltos | precio_promedio |
|-------------------|--------------|-----------------|
| Principiante      | 3            | 246.67          |
| Intermedio        | 1            | 220.00          |
| Avanzado          | 3            | 306.67          |

### Consulta 3: Top saltos para Principiantes
| modalidad                | altura_pies | precio | calificacion |
|--------------------------|-------------|--------|--------------|
| Tandem VIP Fotos y Video | 13000       | 250.00 | 4.95         |
| Tandem Básico            | 10000       | 180.00 | 4.80         |
| Salto Autónomo AFF       | 12000       | 310.00 | 4.70         |