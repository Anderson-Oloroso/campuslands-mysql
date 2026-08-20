
# Ejercicio 045 - Optimización para Biblioteca Gamer

Solución de nivel avanzado retador enfocada en las técnicas de **optimización de bases de datos relacionales en MySQL (indexación multiclumna estratégica, diseño para planes de ejecución eficientes y análisis con `EXPLAIN`)** para un sistema de biblioteca digital de videojuegos de alto rendimiento, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas dependientes, definición de las entidades de catálogo (`generos_opt`, `plataformas_opt`) y la tabla principal optimizada (`detalle_biblioteca_opt`) que incluye restricciones estrictas (`CHECK`, `UNIQUE`) y una estrategia robusta de índices compuestos e individuales (`idx_opt_genero_estado`, `idx_opt_plataforma`, `idx_opt_calificacion_horas`, `idx_opt_fecha_adquisicion`).
- `dml/inserts.sql`: Carga masiva estructurada de catálogos y registros con control de llaves foráneas (`FOREIGN_KEY_CHECKS`).
- `dql/consultas.sql`: Implementación de consultas analíticas y herramientas de diagnóstico de rendimiento mediante el uso de planes de ejecución (`EXPLAIN`), asegurando el aprovechamiento óptimo de los índices creados.

## Tablas Resumen de Datos

### 1. Tablas de Catálogo: `generos_opt` y `plataformas_opt`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único |
| `nombre_genero` / `nombre_plataforma` | VARCHAR(50) | NOT NULL, UNIQUE | Nombre descriptivo del catálogo |
| `descripcion` / `tipo_sistema` | TEXT / VARCHAR | NOT NULL | Detalles técnicos o descriptivos |

### 2. Tabla Principal Optimizada: `detalle_biblioteca_opt`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único |
| `codigo_juego` | VARCHAR(20) | NOT NULL, UNIQUE KEY (`uk_codigo_juego`) | SKU o código de serie único |
| `titulo` | VARCHAR(100) | NOT NULL | Nombre comercial del videojuego |
| `genero_id` | INT | NOT NULL, FOREIGN KEY | Relación con géneros |
| `plataforma_id` | INT | NOT NULL, FOREIGN KEY, INDEX (`idx_opt_plataforma`) | Relación con plataforma |
| `precio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo de adquisición |
| `calificacion` | DECIMAL(3,1) | CHECK (0.0 - 10.0), NOT NULL | Rating de calidad |
| `horas_jugadas` | INT | CHECK (>= 0), Default 0 | Tiempo invertido en el juego |
| `fecha_adquisicion`| DATE | NOT NULL, INDEX (`idx_opt_fecha_adquisicion`) | Fecha de incorporación |
| `estado_biblioteca`| ENUM | instalado / pendiente / completado / archivado | Estatus operativo |

*(Nota: Se implementó un índice compuesto `idx_opt_genero_estado (genero_id, estado_biblioteca)` y un índice de ordenamiento `idx_opt_calificacion_horas (calificacion DESC, horas_jugadas DESC)`).*

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos, tablas y la estrategia completa de indexación.
2. Ejecutar el archivo `inserts.sql` para poblar el sistema con registros de prueba eficientes.
3. Ejecutar el archivo `consultas.sql` para verificar el rendimiento mediante planes de ejecución (`EXPLAIN`) y reportes analíticos.

## Decisiones Técnicas
- **Estrategia de Indexación Compuesta**: Se diseñaron índices multiclumna alineados estrictamente con las consultas de filtrado más costosas (como cruces por género y estado), evitando escaneos completos de tabla (`Full Table Scans`).
- **Diagnóstico con EXPLAIN**: Incorporación sistemática de sentencias de validación de planes de ejecución para comprobar que el motor de MySQL prioriza el uso de índices sobre búsquedas secuenciales.