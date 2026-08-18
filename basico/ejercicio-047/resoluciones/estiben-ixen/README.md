# Ejercicio 047 - tipos de datos para tienda de ropa

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **tienda de ropa**. La práctica se enfoca en el uso de **tipos de datos**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **tipos de datos** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`prendas_vestir`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_prenda` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la prenda |
| `nombre_articulo` | `VARCHAR(80) NOT NULL` | Nombre del diseno |
| `id_marca` | `INT NOT NULL` | Marca disenadora |
| `talla` | `ENUM('XS','S','M','L','XL','XXL') NOT NULL` | Talla del articulo |
| `color` | `VARCHAR(30) NOT NULL` | Color principal |
| `genero` | `ENUM('Hombre','Mujer','Unisex') NOT NULL` | Publico objetivo |
| `precio` | `DECIMAL(7,2) NOT NULL` | Precio en tienda |
| `stock_disponible` | `INT NOT NULL DEFAULT 0` | Unidades en almacen |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `prendas_vestir` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de tienda de ropa, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **tipos de datos**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `tipos de datos`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **tipos de datos** en un entorno realista de **tienda de ropa**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
