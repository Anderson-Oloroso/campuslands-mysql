# Ejercicio 042 - modelado de entidad para playlist musical

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **playlist musical**. La práctica se enfoca en el uso de **modelado de entidad**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **modelado de entidad** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`canciones_playlist`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_cancion` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del track |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la pista |
| `id_artista` | `INT NOT NULL` | Artista creador |
| `genero` | `ENUM('Rock','Pop','Electronica','Hip Hop','Reggaeton','Indie','Jazz') NOT NULL` | Genero musical |
| `duracion_segundos` | `INT NOT NULL` | Longitud del track en segundos |
| `reproducciones` | `BIGINT NOT NULL DEFAULT 0` | Streams totales acumulados |
| `bpm` | `INT NOT NULL DEFAULT 120` | Tempo en beats por minuto |
| `fecha_lanzamiento` | `DATE NOT NULL` | Fecha oficial de salida |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `canciones_playlist` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de playlist musical, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **modelado de entidad**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `modelado de entidad`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **modelado de entidad** en un entorno realista de **playlist musical**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
