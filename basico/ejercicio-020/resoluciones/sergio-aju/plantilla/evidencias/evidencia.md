# Solución Ejercicio 020 (Básico) - Estudio de Tatuajes (SELECT)

## Descripción
Solución del ejercicio básico enfocado en la consulta de datos mediante sentencias `SELECT`, aplicando filtros con `WHERE`, agrupamientos con `GROUP BY`, ordenamientos con `ORDER BY` y límites con `LIMIT` sobre un catálogo de diseños para un estudio de tatuajes.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla `disenos_tatuajes`.
2. Ejecuta `dml/inserts.sql` para insertar los datos de prueba.
3. Ejecuta `dql/consultas.sql` para validar las consultas.

---

## Evidencia de Resultados

### Consulta 2: Promedio de precios por estilo
| estilo                 | total_disenos | precio_promedio |
|------------------------|---------------|-----------------|
| Irezumi / Japones      | 1             | 450.00          |
| Realismo               | 2             | 205.00          |
| Neotradicional         | 1             | 280.00          |
| Traditional / Old School| 1            | 180.00          |
| Tribal / Blackwork     | 1             | 300.00          |

### Consulta 3: Top 3 diseños mejor calificados
| nombre_diseno           | estilo            | precio | calificacion |
|-------------------------|-------------------|--------|--------------|
| Microrealismo Mascota   | Realismo          | 190.00 | 4.95         |
| Dragón Oriental Espalda | Irezumi / Japones | 450.00 | 4.90         |
| Serpiente y Daga        | Traditional       | 180.00 | 4.85         |