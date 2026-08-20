# Ejercicio 060 - Relaciones Simples para Equipo de Streaming

Solución de nivel básico retador enfocada en el diseño y aplicación profesional de **relaciones relacionales simples (Foreign Keys)** y consultas con uniones (`JOIN`) en MySQL para la administración de inventario en un estudio de streaming, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa de tablas dependientes, y establecimiento de una relación de 1 a N entre `marcas_streaming` y `equipos_streaming` aplicando restricciones de integridad (`FOREIGN KEY`, `CHECK`).
- `dml/inserts.sql`: Carga inicial de 5 marcas fabricantes y 8 dispositivos de hardware especializados para streaming (micrófonos, cámaras, luces, capturadoras) con distintos estados operativos.
- `dql/consultas.sql`: Implementación de 5 consultas profesionales que incluyen uniones multitabla (`JOIN`), agrupamientos (`GROUP BY`), filtros compuestos (`WHERE`) y rankings con límites (`LIMIT`).

## Tabla Resumen de Datos (`equipos_streaming` y `marcas_streaming`)
| Tabla | Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `marcas_streaming` | `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único de la marca |
| `marcas_streaming` | `nombre_marca` | VARCHAR(50) | NOT NULL, UNIQUE | Nombre comercial del fabricante |
| `marcas_streaming` | `pais_origen` | VARCHAR(50) | NOT NULL | País de procedencia de la marca |
| `equipos_streaming` | `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del dispositivo |
| `equipos_streaming` | `codigo_equipo` | VARCHAR(20) | NOT NULL, UNIQUE | Código SKU o folio alfanumérico del equipo |
| `equipos_streaming` | `nombre_dispositivo`| VARCHAR(100) | NOT NULL | Nombre comercial del hardware |
| `equipos_streaming` | `id_marca` | INT | FOREIGN KEY (marcas_streaming) | Llave foránea que referencia al fabricante |
| `equipos_streaming` | `tipo_equipo` | ENUM | Microfono / Camara / Iluminacion / etc. | Categoría técnica del accesorio de streaming |
| `equipos_streaming` | `precio_usd` | DECIMAL(10,2)| CHECK (>= 0.00), NOT NULL | Costo comercial del equipo expresado en dólares |
| `equipos_streaming` | `estado_operativo` | ENUM | activo / en_reparacion / retirado / nuevo | Estatus logístico y de funcionamiento actual |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar las tablas relacionando marcas y equipos.
2. Ejecutar el archivo `inserts.sql` para poblar el sistema respetando el orden de dependencia de las llaves foráneas.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de los cruces de información mediante `JOIN` y reportes agregados.

## Decisiones Técnicas
- **Normalización Relacional**: Separar los datos de las marcas en una tabla independiente (`marcas_streaming`) evita la redundancia de texto y permite escalar el catálogo de fabricantes de forma limpia.
- **Integridad Referencial**: Uso de `ON DELETE RESTRICT` para proteger el catálogo de marcas principales frente a eliminaciones accidentales que afecten el inventario activo de equipos.