# Ejercicio 049 - INSERT para Paracaidismo

Solución de nivel básico retador enfocada en el dominio y práctica de la sentencia **`INSERT`** (tanto en formato de fila única explícita como inserciones múltiples optimizadas), gestión de restricciones de validación (`CHECK`) y consultas analíticas en MySQL para un sistema de gestión de saltos en una escuela de paracaidismo, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas anteriores y definición estricta de la tabla `saltos_paracaidismo` incorporando restricciones para validar rangos de altura en pies, precios financieros y calificaciones.
- `dml/inserts.sql`: Carga inicial de registros de prueba utilizando inserciones individuales con columnas explícitas y bloques de inserción múltiple (`Bulk Insert`) para poblar casos normales y límites.
- `dql/consultas.sql`: Implementación de 5 consultas operativas y analíticas que integran filtros condicionales, funciones de agregación (`COUNT`, `AVG`, `SUM`, `ROUND`), agrupamientos (`GROUP BY`), ordenamientos y límites (`LIMIT`).

## Tabla Resumen de Datos (`saltos_paracaidismo`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `codigo_salto` | VARCHAR(20) | NOT NULL, UNIQUE | Código de referencia o SKU único del salto |
| `nombre_paracaidista` | VARCHAR(100) | NOT NULL | Nombre completo del deportista o alumno |
| `tipo_salto` | ENUM | tandem / afc / solo / instructor / acrobatico | Modalidad en la que se ejecuta el salto |
| `altura_pies` | INT | CHECK (1000 - 20000), NOT NULL | Altura de salida del avión medida en pies |
| `precio_usd` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo financiero del salto en dólares |
| `calificacion_experiencia`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación o valoración otorgada por el participante |
| `fecha_salto` | DATE | NOT NULL | Fecha programada o ejecutada del salto |
| `estado_salto` | ENUM | programado / completado / cancelado_clima / reprogramado | Estatus actual del evento de paracaidismo |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura de la tabla.
2. Ejecutar el archivo `inserts.sql` para aplicar las técnicas de inserción de datos (`INSERT` simple y múltiple).
3. Ejecutar el archivo `consultas.sql` para validar el comportamiento de los reportes y filtros analíticos.

## Decisiones Técnicas
- **Estrategia de Inserción Mixta**: Se combinaron sentencias `INSERT` individuales (ideales para la documentación de registros unitarios específicos) con bloques de inserción múltiple (`Bulk Insert`) para optimizar el rendimiento y la sintaxis al poblar catálogos iniciales.
- **Validación de Rangos Físicos**: Uso de restricciones `CHECK` para impedir el almacenamiento de alturas imposibles o fuera de los límites operativos de seguridad del paracaidismo (entre 1,000 y 20,000 pies).