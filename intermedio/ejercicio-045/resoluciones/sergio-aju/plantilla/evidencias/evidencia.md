# Ejercicio 045 - Carga de Datos para Biblioteca Gamer

Solución de nivel intermedio retador enfocada en las estrategias de **carga de datos estructurada, control de transacciones, integridad referencial multi-tabla (Claves Foráneas compuestas) y consultas analíticas avanzadas** en MySQL para un sistema de biblioteca digital de videojuegos, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas previas en orden correcto de dependencias, definición de tablas independientes (`generos_biblioteca`, `plataformas_gamer`) y la tabla relacional principal (`detalle_biblioteca_juegos`), incorporando restricciones de validación con `CHECK` para precios, calificaciones y horas jugadas.
- `dml/inserts.sql`: Script robusto de carga masiva que incluye el control de restricciones de clave foránea (`FOREIGN KEY_CHECKS`), limpieza controlada con `TRUNCATE`, inserción de catálogos base y un conjunto diversificado de 10 registros de videojuegos con métricas de tiempo y costos.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas complejas que combinan múltiples uniones (`INNER JOIN`, `LEFT JOIN`), funciones de agregación (`SUM`, `AVG`, `COUNT`), filtros lógicos avanzados y límites para la generación de reportes de rendimiento y valor de inventario.

## Tablas Resumen de Datos

### 1. Tabla: `generos_biblioteca`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del género |
| `nombre_genero` | VARCHAR(50) | NOT NULL, UNIQUE | Nombre de la categoría del juego |
| `descripcion` | TEXT | NOT NULL | Reseña descriptiva del género |

### 2. Tabla: `plataformas_gamer`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único de la plataforma |
| `nombre_plataforma`| VARCHAR(50) | NOT NULL, UNIQUE | Nombre del cliente o launcher digital (Steam, Epic, etc.) |
| `tipo_sistema` | VARCHAR(30) | NOT NULL | Clasificación del sistema (PC, Consola, Cloud) |

### 3. Tabla Principal: `detalle_biblioteca_juegos`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro de juego |
| `codigo_juego` | VARCHAR(20) | NOT NULL, UNIQUE | SKU o código de serie del videojuego |
| `titulo` | VARCHAR(100) | NOT NULL | Nombre comercial del título |
| `genero_id` | INT | NOT NULL, FOREIGN KEY | Relación con la tabla de géneros |
| `plataforma_id` | INT | NOT NULL, FOREIGN KEY | Relación con la plataforma de ejecución |
| `precio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo de adquisición del título |
| `calificacion` | DECIMAL(3,1) | CHECK (0.0 - 10.0), NOT NULL | Rating de calidad del videojuego |
| `horas_jugadas` | INT | CHECK (>= 0), Default 0 | Tiempo total invertido en el juego |
| `fecha_adquisicion`| DATE | NOT NULL | Fecha en que se añadió a la biblioteca |
| `estado_biblioteca`| ENUM | instalado / pendiente / completado / archivado | Estatus actual del juego |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y sus restricciones relacionales.
2. Ejecutar el archivo `inserts.sql` para realizar la carga masiva y controlada de los catálogos y videojuegos.
3. Ejecutar el archivo `consultas.sql` para validar los reportes analíticos y cruces de información.

## Decisiones Técnicas
- **Estrategia de Carga Masiva**: Uso temporal de `SET FOREIGN_KEY_CHECKS = 0` y `TRUNCATE TABLE` para garantizar que los scripts de inserción puedan ejecutarse múltiples veces de forma limpia y sin errores de restricción referencial.
- **Métricas de Rendimiento**: Incorporación de los campos `horas_jugadas` y `plataforma_id` para permitir un análisis detallado del comportamiento del usuario frente a su biblioteca digital.