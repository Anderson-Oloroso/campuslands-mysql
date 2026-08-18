# Ejercicio 045 - relaciones simples para biblioteca gamer

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **biblioteca gamer**. La práctica se enfoca en el uso de **relaciones simples**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **relaciones simples** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`videojuegos_catalogo`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_videojuego` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del juego |
| `titulo` | `VARCHAR(80) NOT NULL` | Nombre del juego |
| `id_estudio` | `INT NOT NULL` | Estudio creador |
| `genero` | `ENUM('RPG','Accion','Aventura','Estrategia','Shooter','Simulacion','Soulslike') NOT NULL` | Genero |
| `metacritic_score` | `INT NOT NULL` | Puntuacion en Metacritic (1-100) |
| `precio_usd` | `DECIMAL(6,2) NOT NULL DEFAULT 59.99` | Precio de venta |
| `horas_promedio_juego` | `INT NOT NULL` | Duracion estimada de la campana |
| `lanzamiento_anio` | `INT NOT NULL` | Ano de salida al mercado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `videojuegos_catalogo` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de biblioteca gamer, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **relaciones simples**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `relaciones simples`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **relaciones simples** en un entorno realista de **biblioteca gamer**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
