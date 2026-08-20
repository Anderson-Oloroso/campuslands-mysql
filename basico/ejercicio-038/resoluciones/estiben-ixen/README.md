# Ejercicio 038 - UPDATE para futbol sala

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **futbol sala**. La práctica se enfoca en el uso de **UPDATE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **UPDATE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`jugadores_futsal`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del jugador |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del jugador |
| `posicion` | `ENUM('Portero','Cierre','Ala','Pivot') NOT NULL` | Posicion en campo |
| `id_equipo` | `INT NOT NULL` | Equipo asignado |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles en temporada |
| `tarjetas_amarillas` | `INT NOT NULL DEFAULT 0` | Amonestaciones |
| `tarjetas_rojas` | `INT NOT NULL DEFAULT 0` | Expulsiones |
| `valoracion` | `DECIMAL(4,2) NOT NULL DEFAULT 7.00` | Puntaje de rendimiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `jugadores_futsal` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de futbol sala, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **UPDATE**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `UPDATE`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **UPDATE** en un entorno realista de **futbol sala**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
