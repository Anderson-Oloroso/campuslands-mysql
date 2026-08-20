# Solución Ejercicio 020 (Avanzado) - Estudio de Tatuajes (Índices)

## Descripción
Solución del ejercicio avanzado enfocado en la indexación y optimización de consultas en MySQL:
- `idx_estilo`: Índice B-Tree para acelerar filtrados por estilo de diseño.
- `idx_estado_fecha`: Índice compuesto para consultas de reportes con filtros por estado y rangos de fecha.
- `idx_costo_calificacion`: Índice compuesto para búsquedas por rango de montos y nivel de satisfacción.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla y definir los índices.
2. Ejecuta `dml/inserts.sql` para poblar los registros iniciales.
3. Ejecuta `dql/consultas.sql` para validar las consultas y revisar los planes de ejecución con `EXPLAIN`.

---

## Evidencia de Resultados

### Plan de Ejecución (EXPLAIN Consulta 1)
| id | select_type | table          | type | possible_keys | key        | key_len | rows | Extra       |
|----|-------------|----------------|------|---------------|------------|---------|------|-------------|
| 1  | SIMPLE      | citas_tatuajes | ref  | idx_estilo    | idx_estilo | 322     | 3    | Using where |

### Consulta 3: Ingresos y satisfacción por estilo de tatuaje
| estilo_diseno            | total_citas | costo_promedio | calificacion_promedio |
|--------------------------|-------------|----------------|-----------------------|
| Realismo B&G             | 3           | 375.00         | 4.90                  |
| Neotradicional           | 1           | 210.00         | 4.70                  |
| Fine Line                | 1           | 150.00         | 4.95                  |
| Traditional / Old School | 1           | 110.00         | 4.60                  |