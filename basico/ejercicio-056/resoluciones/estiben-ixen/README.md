# Ejercicio 056 - validaciones simples para videojuego RPG

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **videojuego RPG**. La práctica se enfoca en el uso de **validaciones simples**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **validaciones simples** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`heroes_rpg`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_heroe` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del personaje |
| `nombre_heroe` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del avatar |
| `id_clase` | `INT NOT NULL` | Clase asignada |
| `nivel` | `INT NOT NULL DEFAULT 1` | Nivel de personaje (1-100) |
| `puntos_vida` | `INT NOT NULL` | Vida maxima HP |
| `puntos_mana` | `INT NOT NULL` | Mana disponible MP |
| `oro_acumulado` | `INT NOT NULL DEFAULT 0` | Monedas de oro |
| `gremio` | `VARCHAR(60) NOT NULL DEFAULT 'Sin Gremio'` | Clan al que pertenece |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `heroes_rpg` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de videojuego RPG, permitiendo probar filtros, ordenamientos y cálculos.

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

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **validaciones simples** en un entorno realista de **videojuego RPG**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
