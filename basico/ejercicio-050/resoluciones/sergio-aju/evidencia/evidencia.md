# Ejercicio 050 - SELECT para Estudio de Tatuajes

Solución de nivel básico retador enfocada en el dominio y práctica avanzada de la sentencia **`SELECT`** en MySQL (proyecciones con alias, filtros lógicos complejos, ordenamientos múltiples, funciones de agregación como `SUM`, `AVG`, `COUNT`, agrupamientos con `GROUP BY` y cálculos derivados) para un sistema de gestión en un estudio de tatuajes, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas, y definición estructurada de la tabla `citas_tatuajes` aplicando tipos de datos estrictos, restricciones de integridad y validaciones lógicas con `CHECK`.
- `dml/inserts.sql`: Carga inicial de 8 registros de citas de tatuajes variadas en estilos artísticos, artistas responsables, duraciones, costos en USD, calificaciones y estados operativos.
- `dql/consultas.sql`: Implementación de 5 consultas profesionales que resuelven requerimientos de negocio, reportes analíticos de rentabilidad por hora, estadísticas por categoría y rankings de valor.

## Tabla Resumen de Datos (`citas_tatuajes`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único principal del registro |
| `codigo_cita` | VARCHAR(20) | NOT NULL, UNIQUE | Folio alfanumérico o código único de la cita |
| `nombre_cliente` | VARCHAR(100) | NOT NULL | Nombre completo de la persona que recibe el tatuaje |
| `nombre_artista` | VARCHAR(100) | NOT NULL | Nombre del tatuador profesional a cargo |
| `estilo_tatuaje` | ENUM | realismo / tradicional / neotradicional / minimalista / japones / blackwork | Estilo o técnica artística aplicada |
| `tiempo_estimado_horas`| DECIMAL(4,1) | CHECK (> 0.0), NOT NULL | Duración calculada de la sesión en horas |
| `costo_usd` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor monetario total del servicio en dólares |
| `calificacion_satisfaccion`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación o rating de satisfacción del cliente |
| `fecha_cita` | DATE | NOT NULL | Fecha programada o ejecutada para la sesión |
| `estado_cita` | ENUM | programada / completada / cancelada / en_proceso | Estatus operativo actual de la cita |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura tabular.
2. Ejecutar el archivo `inserts.sql` para poblar el sistema con las citas iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar los reportes analíticos y la proyección de datos.

## Decisiones Técnicas
- **Proyecciones Analíticas**: Uso intensivo de expresiones matemáticas dentro del `SELECT` (como el cálculo de rentabilidad por hora: `costo_usd / tiempo_estimado_horas`) para aportar valor de negocio real más allá de la simple recuperación de registros.
- **Control Financiero y Temporal**: Empleo de `DECIMAL` para los costos e intervalos de tiempo, asegurando reportes financieros precisos y sin errores de redondeo.