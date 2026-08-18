# Ejercicio 059 - fechas basicas para marketplace de accesorios

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **marketplace de accesorios**. La práctica se enfoca en el uso de **fechas basicas**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **fechas basicas** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`productos_accesorios`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_producto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del producto |
| `nombre_producto` | `VARCHAR(80) NOT NULL` | Nombre del articulo |
| `id_vendedor` | `INT NOT NULL` | Tienda vendedora |
| `categoria` | `ENUM('Audio','Teclados y Mouses','Cables y Hubs','Soportes y Ergonomia','Iluminacion RGB','Mochilas y Fundas') NOT NULL` | Categoria |
| `precio` | `DECIMAL(7,2) NOT NULL` | Precio en USD |
| `stock` | `INT NOT NULL DEFAULT 0` | Disponibilidad en bodega |
| `es_envio_gratis` | `ENUM('Si','No') DEFAULT 'Si'` | Politica de envio |
| `valoracion_promedio` | `DECIMAL(3,2) NOT NULL DEFAULT 4.50` | Rating de clientes |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `productos_accesorios` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de marketplace de accesorios, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **fechas basicas**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `fechas basicas`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **fechas basicas** en un entorno realista de **marketplace de accesorios**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
