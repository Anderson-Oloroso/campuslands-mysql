# Ejercicio 048 - PRIMARY KEY para Viajes y Turismo

Solución de nivel básico retador enfocada en el diseño e implementación rigurosa de la **`PRIMARY KEY`** y restricciones de integridad en MySQL para un sistema de gestión de paquetes turísticos de una agencia de viajes, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas, y definición estructurada de la tabla `paquetes_turisticos` utilizando un campo `id` autoincremental como clave primaria (`PRIMARY KEY`), un código único de control (`UNIQUE`), y restricciones lógicas financieras y de validación (`CHECK`).
- `dml/inserts.sql`: Carga inicial de 8 registros de destinos turísticos con variedad de precios, duraciones, cupos, calificaciones y estados operativos.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen filtrados relacionales, funciones de agregación (`COUNT`, `AVG`, `SUM`), cálculos basados en tipos numéricos, ordenamientos y límites (`LIMIT`).

## Tabla Resumen de Datos (`paquetes_turisticos`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único principal de cada registro |
| `codigo_paquete` | VARCHAR(20) | NOT NULL, UNIQUE | Código SKU o folio alfanumérico único del tour |
| `nombre_destino` | VARCHAR(100) | NOT NULL | Nombre comercial del paquete o destino turístico |
| `pais_destino` | VARCHAR(50) | NOT NULL | País donde se lleva a cabo la experiencia de viaje |
| `duracion_dias` | INT | CHECK (> 0), NOT NULL | Tiempo de duración del viaje en días |
| `precio_por_persona` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Costo monetario por pasajero |
| `cupos_disponibles` | INT | CHECK (>= 0), Default 0 | Plazas vacantes restantes para el tour |
| `calificacion_experiencia`| DECIMAL(3,1) | CHECK (0.0 - 5.0), NOT NULL | Puntuación o rating de satisfacción del viaje |
| `estado_paquete` | ENUM | disponible / agotado / proximamente / cancelado | Estatus actual de comercialización del paquete |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos, la estructura primaria y las restricciones.
2. Ejecutar el archivo `inserts.sql` para poblar el catálogo de viajes con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas analíticas y reportes de negocio.

## Decisiones Técnicas
- **Clave Primaria Independiente**: Uso de un campo numérico entero autoincremental (`id INT AUTO_INCREMENT PRIMARY KEY`) como clave primaria estándar para garantizar uniones limpias y rendimiento óptimo en índices, complementado con un código de negocio único (`codigo_paquete`).
- **Integridad de Datos**: Aplicación de restricciones `CHECK` para asegurar que los precios, duraciones y cupos mantengan coherencia lógica frente a casos límite.