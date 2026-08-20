# Ejercicio 046 - CREATE TABLE para restaurante de comida urbana

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **restaurante de comida urbana**. La práctica se enfoca en el uso de **CREATE TABLE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **CREATE TABLE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`platillos_urbanos`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_platillo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del plato |
| `nombre_platillo` | `VARCHAR(80) NOT NULL` | Nombre comercial |
| `id_categoria` | `INT NOT NULL` | Categoria en la carta |
| `precio` | `DECIMAL(6,2) NOT NULL` | Precio en USD |
| `tiempo_preparacion_min` | `INT NOT NULL DEFAULT 15` | Minutos de cocina |
| `calorias` | `INT NOT NULL` | Aporte energetico kcal |
| `es_vegetariano` | `ENUM('Si','No') DEFAULT 'No'` | Opcion apta para vegetarianos |
| `disponible` | `ENUM('Si','No') DEFAULT 'Si'` | Campo disponible |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `platillos_urbanos` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de restaurante de comida urbana, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **CREATE TABLE**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `CREATE TABLE`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **CREATE TABLE** en un entorno realista de **restaurante de comida urbana**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
