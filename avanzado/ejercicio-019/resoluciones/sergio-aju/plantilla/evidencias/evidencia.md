# Solución Ejercicio 019 (Avanzado) - Paracaidismo (Triggers)

## Descripción
Solución del ejercicio avanzado enfocado en la implementación de **Triggers** en MySQL:
- `trg_validar_altura_salto`: Disparador `BEFORE INSERT` para garantizar las normas de seguridad (altura >= 8000 pies).
- `trg_auditar_cambio_salto`: Disparador `AFTER UPDATE` para guardar un historial automático en la tabla `auditoria_saltos` ante modificaciones de precios o estados.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas y registrar los triggers.
2. Ejecuta `dml/inserts.sql` para insertar los datos iniciales y realizar los `UPDATE` de prueba.
3. Ejecuta `dql/consultas.sql` para consultar los resultados y verificar el historial de auditoría.

---

## Evidencia de Resultados

### Consulta 1: Historial de auditoría tras ejecuciones de UPDATE
| auditoria_id | modalidad               | accion        | precio_anterior | precio_nuevo | estado_anterior | estado_nuevo |
|--------------|-------------------------|---------------|-----------------|--------------|-----------------|--------------|
| 1            | Tandem Básico           | ACTUALIZACION | 180.00          | 195.00       | activo          | activo       |
| 2            | Tandem Promocional      | ACTUALIZACION | 120.00          | 140.00       | inactivo        | activo       |
| 3            | Wingsuit Vuelo con Traje| ACTUALIZACION | 350.00          | 330.00       | activo          | activo       |

### Consulta 3: Resumen agrupado por nivel de experiencia
| nivel_experiencia | total_saltos | precio_promedio | precio_maximo |
|-------------------|--------------|-----------------|---------------|
| Principiante      | 4            | 223.75          | 310.00        |
| Intermedio        | 1            | 220.00          | 220.00        |
| Avanzado          | 3            | 300.00          | 330.00        |