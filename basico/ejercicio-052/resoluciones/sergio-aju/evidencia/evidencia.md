# Ejercicio 052 - ORDER BY para Animación 3D

Solución de nivel básico retador enfocada en el dominio profesional y estructurado de la cláusula **`ORDER BY`** en MySQL (ordenamientos ascendentes y descendentes, jerarquías de múltiples columnas, expresiones derivadas calculadas y limitaciones de resultados con `LIMIT`) para la gestión de proyectos en un estudio de animación 3D, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas, y definición estructurada de la tabla `proyectos_animacion_3d` aplicando tipos estrictos y restricciones `CHECK` para garantizar consistencia numérica en tiempos de render, fotogramas y presupuestos.
- `dml/inserts.sql`: Carga inicial de 8 registros de secuencias de animación 3D variadas en software (Blender, Maya, Houdini, etc.), presupuestos, fotogramas y estados operativos.
- `dql/consultas.sql`: Implementación de 5 consultas profesionales enfocadas en resolver necesidades analíticas mediante ordenamientos simples, compuestos, calculados y rankings con `LIMIT`.

## Tabla Resumen de Datos (`proyectos_animacion_3d`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único principal del registro |
| `codigo_proyecto` | VARCHAR(20) | NOT NULL, UNIQUE | Folio alfanumérico o SKU único de la secuencia 3D |
| `nombre_secuencia` | VARCHAR(100) | NOT NULL | Nombre descriptivo del plano o animación |
| `software_empleado` | ENUM | Blender / Maya / Cinema 4D / Houdini / ZBrush | Herramienta de modelado y animación utilizada |
| `fotogramas_totales`| INT | CHECK (> 0), NOT NULL | Cantidad de frames o cuadros de la animación |
| `tiempo_render_horas`| DECIMAL(6,1) | CHECK (> 0.0), NOT NULL | Horas invertidas en el proceso de renderizado |
| `presupuesto_usd` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo o asignación económica del proyecto en dólares |
| `calificacion_calidad`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación o rating de calidad visual obtenido |
| `estado_proyecto` | ENUM | renderizado / en_produccion / en_composicion / pausado | Estatus actual del ciclo de producción de la animación |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura tabular.
2. Ejecutar el archivo `inserts.sql` para poblar el sistema con las secuencias 3D de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el comportamiento de los distintos tipos de ordenamiento (`ORDER BY`).

## Decisiones Técnicas
- **Criterios de Ordenamiento Multinivel**: Se implementaron consultas con múltiples columnas de orden (ej. por calificación y secundariamente por presupuesto) para reflejar ordenamientos profesionales de negocio.
- **Precisión Numérica**: Uso de `DECIMAL` para el tiempo de render y los presupuestos, permitiendo un cálculo exacto y ordenado de la rentabilidad u optimización de recursos por hora.