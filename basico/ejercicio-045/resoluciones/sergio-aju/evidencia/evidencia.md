# Ejercicio 045 - Relaciones Simples para Biblioteca Gamer

Solución de nivel básico retador enfocada en el diseño e implementación de **relaciones simples (Claves Foráneas)** entre entidades relacionales en MySQL para un sistema de gestión de una biblioteca digital de videojuegos, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas previas en orden correcto de dependencias, definición de la tabla independiente `generos_biblioteca` y la tabla dependiente `videojuegos_biblioteca` vinculada mediante una clave foránea (`FOREIGN KEY`), incorporando restricciones de validación con `CHECK` para precios y calificaciones.
- `dml/inserts.sql`: Carga inicial de registros relacionales (4 géneros y 8 videojuegos detallados con variaciones de estado, precio y calificaciones).
- `dql/consultas.sql`: Implementación de 5 consultas que integran operaciones de cruce (`INNER JOIN`, `LEFT JOIN`), filtros relacionales, funciones de agregación (`COUNT`, `AVG`, `SUM`), ordenamientos y reportes analíticos con límites.

## Tablas Resumen de Datos

### Tabla: `generos_biblioteca`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del género |
| `nombre_genero` | VARCHAR(50) | NOT NULL, UNIQUE | Nombre descriptivo de la categoría de juego |
| `descripcion` | TEXT | NOT NULL | Reseña o explicación de las características del género |

### Tabla: `videojuegos_biblioteca`
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del videojuego |
| `codigo_juego` | VARCHAR(20) | NOT NULL, UNIQUE | Código de serie o SKU único del juego |
| `titulo` | VARCHAR(100) | NOT NULL | Nombre oficial del videojuego |
| `genero_id` | INT | NOT NULL, FOREIGN KEY | Clave foránea que referencia al género del juego |
| `precio` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo comercial de adquisición del juego |
| `calificacion` | DECIMAL(3,1) | CHECK (0.0 - 10.0), NOT NULL | Puntuación o rating obtenido por la crítica/jugadores |
| `fecha_lanzamiento`| DATE | NOT NULL | Fecha oficial de salida al mercado |
| `estado_biblioteca`| ENUM | instalado / pendiente / completado / archivado | Estatus actual del juego en la biblioteca del usuario |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la relación uno a muchos (`1:N`).
2. Ejecutar el archivo `inserts.sql` para poblar los géneros y los videojuegos asociados.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las uniones relacionales y los reportes analíticos.

## Decisiones Técnicas
- **Normalización Relacional**: Separación de los géneros en una tabla independiente para evitar la redundancia de datos y mantener la consistencia al actualizar categorías.
- **Integridad Referencial**: Uso de la restricción `ON DELETE RESTRICT` para evitar la eliminación accidental de géneros que posean videojuegos activos asociados en la biblioteca.