# Ejercicio 041 - validaciones simples para pingpong

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **pingpong**. La práctica se enfoca en el uso de **validaciones simples**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **validaciones simples** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`jugadores_pingpong`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del tenimesista |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del jugador |
| `mano_habil` | `ENUM('Derecha','Izquierda') NOT NULL` | Lateralidad |
| `estilo_agarre` | `ENUM('Shakehand','Penhold') NOT NULL` | Tipo de empunadura |
| `id_club` | `INT NOT NULL` | Club de afiliacion |
| `ranking_puntos` | `INT NOT NULL DEFAULT 1000` | Puntos en el ranking oficial |
| `torneos_ganados` | `INT NOT NULL DEFAULT 0` | Titulos individuales |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `jugadores_pingpong` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de pingpong, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **validaciones simples**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `validaciones simples`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **validaciones simples** en un entorno realista de **pingpong**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
