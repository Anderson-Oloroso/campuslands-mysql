# Solución Ejercicio 019 (Intermedio) - Paracaidismo (HAVING)

## Descripción
Solución del ejercicio intermedio enfocado en el filtrado de datos agrupados aplicando la cláusula **`HAVING`** en combinación con funciones de agregación (`AVG`, `COUNT`, `SUM`) sobre un catálogo de saltos en paracaidismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla `saltos_paracaidismo`.
2. Ejecuta `dml/inserts.sql` para poblar los datos de prueba.
3. Ejecuta `dql/consultas.sql` para validar las consultas con agrupamientos y filtros `HAVING`.

---

## Evidencia de Resultados

### Consulta 1: Niveles con precio promedio superior a $250.00
| nivel_experiencia | total_modalidades | precio_promedio |
|-------------------|-------------------|-----------------|
| Principiante      | 3                 | 246.67          |
| Avanzado          | 3                 | 306.67          |

### Consulta 2: Zonas con 2 o más modalidades activas
| zona_salto | cantidad_saltos | promedio_calificacion |
|------------|-----------------|-----------------------|
| Zona Costa | 2               | 4.88                  |
| Zona Valle | 3               | 4.57                  |
| Zona Montaña| 2               | 4.88                  |