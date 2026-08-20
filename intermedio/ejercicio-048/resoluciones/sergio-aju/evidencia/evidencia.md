# Solución Ejercicio 048 (Intermedio Retador) - Viajes y Turismo (GROUP BY)

## Descripción
Solución estructurada enfocada en la agrupación de datos (`GROUP BY`), agregaciones (`SUM`, `AVG`, `COUNT`) y filtros sobre resultados agrupados (`HAVING`) aplicados a una agencia de viajes y turismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para construir el esquema relacional de 4 tablas.
2. Ejecuta `dml/inserts.sql` para registrar los destinos, paquetes, turistas y ventas.
3. Ejecuta `dql/consultas.sql` para consultar los indicadores agrupados del negocio.

---

## Evidencia de Resultados

### Consulta 1: Ingresos e itinerarios por país de destino
| destino_pais | total_reservas | total_turistas | ingresos_totales |
|--------------|----------------|----------------|------------------|
| México       | 2              | 4              | 3400.00          |
| España       | 1              | 2              | 2400.00          |
| Guatemala    | 4              | 9              | 2720.00          |
| Perú         | 1              | 1              | 920.00           |

### Consulta 4: Clientes con inversión mayor o igual a $1,000 (HAVING)
| cliente_id | cliente        | nacionalidad  | reservas_confirmadas | total_invertido |
|------------|----------------|---------------|----------------------|-----------------|
| 1          | Carlos Mendoza | Guatemalteca  | 3                    | 1780.00         |
| 2          | Valeria Silva  | Mexicana      | 1                    | 1700.00         |
| 4          | Sofía Ramírez  | Colombiana    | 1                    | 2400.00         |