# Ejercicio 057 - modelado de entidad para videojuego de accion y aventura

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **videojuego de accion y aventura**. La práctica se enfoca en el uso de **modelado de entidad**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **modelado de entidad** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`artefactos_magicos`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artefacto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del objeto legendario |
| `nombre_artefacto` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre de la reliquia |
| `id_reino` | `INT NOT NULL` | Reino de procedencia |
| `tipo_artefacto` | `ENUM('Espada Ancestral','Amuleto Mistico','Escudo Divino','Tomo de Poder','Arco Legendario') NOT NULL` | Tipo de item |
| `poder_ataque` | `INT NOT NULL DEFAULT 0` | Poder ofensivo |
| `poder_defensa` | `INT NOT NULL DEFAULT 0` | Poder defensivo |
| `durabilidad` | `INT NOT NULL DEFAULT 100` | Integridad del item |
| `es_legendario` | `ENUM('Si','No') DEFAULT 'Si'` | Campo es_legendario |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `artefactos_magicos` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de videojuego de accion y aventura, permitiendo probar filtros, ordenamientos y cálculos.

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

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **modelado de entidad** en un entorno realista de **videojuego de accion y aventura**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
