# Ejercicio 054 - DELETE Controlado para Soldadura

Solución de nivel básico retador enfocada en el dominio profesional y seguro de la sentencia **`DELETE`** en MySQL (eliminaciones unitarias con llaves únicas, purgas masivas condicionadas mediante cláusulas `WHERE` rigurosas para remover registros cancelados o no conformes críticos, y validaciones de integridad posteriores) para un sistema de control de calidad en soldadura industrial, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas, y definición estructurada de la tabla `inspecciones_soldadura` aplicando tipos estrictos y restricciones `CHECK` para garantizar datos coherentes en longitudes y resistencias a la tracción.
- `dml/inserts.sql`: Carga inicial de 8 registros de inspecciones de soldadura e implementación secuencial de instrucciones `DELETE` controladas para simular la depuración operativa de registros obsoletos, cancelados o técnicamente deficientes.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas orientadas a verificar el estado post-eliminación de la tabla, calcular métricas por proceso de soldadura, evaluar resultados y obtener índices de calidad estructural.

## Tabla Resumen de Datos (`inspecciones_soldadura`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único principal del registro |
| `codigo_inspeccion` | VARCHAR(20) | NOT NULL, UNIQUE | Folio alfanumérico o código SKU único de la prueba de soldadura |
| `nombre_soldador` | VARCHAR(100) | NOT NULL | Nombre completo del técnico operario responsable del cordón |
| `proceso_soldadura` | ENUM | SMAW / GMAW / GTAW / FCAW / SAW | Método o técnica de soldadura industrial aplicada |
| `material_base` | ENUM | Acero al Carbono / Acero Inoxidable / Aluminio / Aleacion de Niquel | Tipo de aleación metálica unida |
| `longitud_cordon_cm`| DECIMAL(8,2) | CHECK (> 0.0), NOT NULL | Longitud desarrollada de la soldadura en centímetros |
| `resistencia_traccion_mpa`| DECIMAL(8,2)| CHECK (> 0.0), NOT NULL | Límite de resistencia a la tracción medido en MegaPascals (MPa) |
| `resultado_inspeccion`| ENUM | aprobado / rechazado / reproceso_pendiente / cancelado | Estatus de calidad obtenido en la evaluación técnica |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura tabular.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales y aplicar de manera controlada las sentencias `DELETE`.
3. Ejecutar el archivo `consultas.sql` para validar que los datos eliminados no interfieran y que los reportes analíticos reflejen únicamente la información activa.

## Decisiones Técnicas
- **Seguridad en Eliminaciones (`DELETE` con `WHERE`)**: Se evita estrictamente el uso de sentencias `DELETE` sin restricciones, empleando siempre condiciones basadas en claves primarias o estados operativos específicos (ej. `resultado_inspeccion = 'cancelado'`) para cumplir con buenas prácticas de desarrollo.
- **Validación de Criterios Técnicos**: Uso de filtros compuestos con operadores lógicos (`AND`) para eliminar únicamente aquellos registros que cumplen con múltiples criterios de no conformidad simultáneamente.