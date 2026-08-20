# Solución Ejercicio 049 (Intermedio Retador) - Paracaidismo (HAVING)

## Descripción
Solución técnica enfocada en el filtrado de conjuntos agrupados mediante la cláusula `HAVING` en MySQL. Permite aplicar condiciones sobre valores agregados (`SUM`, `AVG`, `COUNT`, `MAX`) en un contexto de logística y métricas de saltos de paracaidismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para instanciar el esquema con sus restricciones y claves foráneas.
2. Ejecuta `dml/inserts.sql` para cargar registros realistas de paracaidistas, instructores, dropzones y bitácoras de saltos.
3. Ejecuta `dql/consultas.sql` para validar las métricas filtradas mediante `HAVING`.

---

## Evidencia de Resultados

### Consulta 1: Paracaidistas con 2 o más saltos completados
| paracaidista_id | paracaidista   | licencia | total_saltos_completados |
|-----------------|----------------|----------|--------------------------|
| 1               | Carlos Mendoza | A        | 3                        |
| 3               | Diego Arriola  | B        | 2                        |
| 4               | Sofía Ramírez  | C        | 2                        |

### Consulta 3: Modalidades con facturación agregada mayor a $400
| modalidad | cantidad_saltos | facturacion_total | altitud_promedio_pies |
|-----------|-----------------|-------------------|-----------------------|
| Solo AFF  | 3               | 790.00            | 13833                 |
| Wingsuit  | 2               | 600.00            | 15000                 |
| Formacion | 1               | 210.00 (Filtrado) | —                     |