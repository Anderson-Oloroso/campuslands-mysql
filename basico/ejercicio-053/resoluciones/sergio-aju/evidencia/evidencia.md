# Ejercicio 053 - UPDATE para Arquitectura 3D

Solución de nivel básico retador enfocada en el dominio profesional y seguro de la sentencia **`UPDATE`** en MySQL (modificaciones unitarias con claves únicas, actualizaciones masivas basadas en filtros condicionales `WHERE`, ajustes aritméticos porcentuales y control de cambios) para un sistema de gestión en un estudio de arquitectura 3D, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas, y definición estructurada de la tabla `proyectos_arquitectura_3d` aplicando tipos estrictos y restricciones `CHECK` para garantizar consistencia numérica en superficies, honorarios y calificaciones.
- `dml/inserts.sql`: Carga inicial de 8 registros de proyectos arquitectónicos e implementación secuencial de instrucciones `UPDATE` para simular escenarios reales de negocio (incrementos de presupuesto, cambios de estatus operativo y ajustes porcentuales masivos).
- `dql/consultas.sql`: Implementación de 5 consultas analíticas enfocadas en verificar el resultado de las modificaciones, calcular métricas por tipo de inmueble, evaluar estados y obtener indicadores de valor por metro cuadrado.

## Tabla Resumen de Datos (`proyectos_arquitectura_3d`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único principal del registro |
| `codigo_proyecto` | VARCHAR(20) | NOT NULL, UNIQUE | Folio alfanumérico o código SKU único del proyecto |
| `nombre_proyecto` | VARCHAR(100) | NOT NULL | Nombre comercial o descriptivo de la obra arquitectónica |
| `tipo_inmueble` | ENUM | residencial / comercial / corporativo / industrial / paisajismo | Clasificación funcional del diseño |
| `superficie_m2` | DECIMAL(10,2)| CHECK (> 0.0), NOT NULL | Área total del proyecto expresada en metros cuadrados |
| `honorarios_usd` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo o remuneración económica del proyecto en dólares |
| `calificacion_cliente`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación de satisfacción otorgada por el cliente |
| `estado_proyecto` | ENUM | borrador / en_render / revision_cliente / aprobado / entregado | Estatus actual del ciclo de desarrollo del modelado 3D |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura tabular.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales y aplicar de forma secuencial las sentencias `UPDATE`.
3. Ejecutar el archivo `consultas.sql` para validar que los cambios de datos se reflejen correctamente en los reportes analíticos.

## Decisiones Técnicas
- **Precaución en Actualizaciones Masivas**: Se estructuraron las sentencias `UPDATE` utilizando siempre cláusulas `WHERE` explícitas para evitar modificaciones accidentales en toda la tabla, aplicando buenas prácticas de desarrollo en bases de datos relacionales.
- **Cálculos Financieros Dinámicos**: Uso de expresiones aritméticas directamente en el `UPDATE` (ej. incremento porcentual `honorarios_usd * 1.10`) para mantener la integridad de los datos financieros frente a reajustes comerciales.