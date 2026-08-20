# Solución Ejercicio 055 (Intermedio Retador) - Laboratorio de Fórmulas Químicas (Uso de UNIQUE)

## Descripción
Esta solución aplica restricciones de integridad **`UNIQUE`** simples y compuestas en MySQL para evitar duplicidad de datos en un entorno de **Laboratorio Químico**.

### Restricciones UNIQUE Implementadas:
1. **Atributos Simples**:
   - `quimicos_analistas`: `email` y `codigo_colegiado` únicos.
   - `reactivos`: `codigo_reactivo` y `numero_cas` únicos (Garantiza trazabilidad estándar CAS).
   - `formulas_quimicas`: `codigo_formula` y `nombre_formula` únicos.
2. **Atributos Compuestos (Tabla Intermedia)**:
   - `uk_formula_reactivo`: Previene registrar dos veces el mismo reactivo dentro de una misma fórmula.
   - `uk_formula_orden`: Previene asignar el mismo número de paso u orden de adición a dos reactivos en la misma mezcla.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` en MySQL para levantar el esquema con todas sus restricciones `UNIQUE`.
2. Ejecutar `dml/inserts.sql` para poblar el catálogo de sustancias y fórmulas.
3. Ejecutar `dql/consultas.sql` para ejecutar las consultas de verificación y reportes.

---

## Evidencia de Resultados

### Consulta 1: Resumen de Fórmulas
| codigo_formula | nombre_formula                         | quimico_responsable | codigo_colegiado | ph_objetivo | estado          | total_reactivos_empleados |
|----------------|----------------------------------------|---------------------|------------------|-------------|-----------------|---------------------------|
| FORM-2026-D1   | Sérum Antioxidante Estabilizado       | Daniel Navarro      | COL-Q-4102       | 3.50        | En Desarrollo   | 3                         |
| FORM-2026-A1   | Solución Buffer Fosfato Estándar       | Elena Vásquez       | COL-Q-1049       | 7.40        | Aprobada        | 2                         |

### Consulta 4: Secuencia de Adición en FORM-2026-D1
| codigo_formula | nombre_formula                    | orden_adicion | nombre_quimico          | numero_cas | concentración_proporción | unidad_medida |
|----------------|-----------------------------------|---------------|-------------------------|------------|--------------------------|---------------|
| FORM-2026-D1   | Sérum Antioxidante Estabilizado  | 1             | Agua Desionizada (H2O)  | 7732-18-5  | 600.000                  | mL/L          |
| FORM-2026-D1   | Sérum Antioxidante Estabilizado  | 2             | Ácido Ascórbico (C6H8O6)| 50-81-7    | 150.000                  | g/L           |
| FORM-2026-D1   | Sérum Antioxidante Estabilizado  | 3             | Etanol Anhidro (C2H5OH) | 64-17-5    | 250.000                  | mL/L          |