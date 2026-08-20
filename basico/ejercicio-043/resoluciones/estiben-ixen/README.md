# Ejercicio 043 - filtros por estado para catalogo de peliculas de miedo

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **catalogo de peliculas de miedo**. La práctica se enfoca en el uso de **filtros por estado**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **filtros por estado** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`peliculas_terror`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_pelicula` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del filme |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo oficial de la pelicula |
| `id_director` | `INT NOT NULL` | Director a cargo |
| `subgenero` | `ENUM('Sobrenatural','Slasher','Psicologico','Gore','Monstruos','Cosmico') NOT NULL` | Subgenero de terror |
| `duracion_min` | `INT NOT NULL` | Duracion en minutos |
| `presupuesto_millones` | `DECIMAL(6,2) NOT NULL` | Presupuesto de produccion en USD |
| `taquilla_millones` | `DECIMAL(6,2) NOT NULL` | Recaudacion global en USD |
| `clasificacion_edad` | `ENUM('PG-13','R','NC-17') NOT NULL` | Clasificacion de edad |
| `estreno_anio` | `INT NOT NULL` | Ano de lanzamiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `peliculas_terror` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de catalogo de peliculas de miedo, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **filtros por estado**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `filtros por estado`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **filtros por estado** en un entorno realista de **catalogo de peliculas de miedo**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
