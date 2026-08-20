# Ejercicio 051 - WHERE para dibujo digital

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **dibujo digital**. La práctica se enfoca en el uso de **WHERE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **WHERE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`obras_digitales`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_obra` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la pieza digital |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la obra |
| `id_ilustrador` | `INT NOT NULL` | Artista creador |
| `estilo` | `ENUM('Concept Art','Anime/Manga','Splash Art','Pixel Art','Retrato Semirrealista') NOT NULL` | Estilo visual |
| `cantidad_capas` | `INT NOT NULL` | Total de capas en el archivo .psd/.clip |
| `ancho_px` | `INT NOT NULL` | Resolucion horizontal |
| `alto_px` | `INT NOT NULL` | Resolucion vertical |
| `precio_comision` | `DECIMAL(7,2) NOT NULL` | Costo en USD |
| `fecha_creacion` | `DATE NOT NULL` | Fecha de finalizacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `obras_digitales` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de dibujo digital, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **WHERE**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `WHERE`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **WHERE** en un entorno realista de **dibujo digital**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
