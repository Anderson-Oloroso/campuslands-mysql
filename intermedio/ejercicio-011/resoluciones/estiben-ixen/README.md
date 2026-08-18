# Ejercicio 011 - CHECK para pingpong

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **pingpong**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **CHECK**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **CHECK** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `clubes_pingpong`
Almacena clubes y federaciones de tenis de mesa.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_club` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del club |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del club de tenis de mesa |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de ubicacion |
| `categoria` | `ENUM('Profesional','Semi-Pro','Amateur') DEFAULT 'Profesional'` | Campo categoria |

### Tabla Secundaria: `jugadores_pingpong`
Almacena tenimesistas con su ranking mundial ITTF y estilo de juego.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `clubes_pingpong` y `jugadores_pingpong` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `clubes_pingpong` y posteriormente en `jugadores_pingpong`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **CHECK**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `CHECK`
- `INNER JOIN` y `LEFT JOIN`
- `GROUP BY` y cláusula `HAVING`
- Subconsultas escalares y correlacionadas

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` (creación de base de datos, tablas y restricciones).
2. Ejecutar `dml/inserts.sql` (poblado de tablas respetando la jerarquía relacional).
3. Ejecutar `dql/consultas.sql` (validación de reportes y consultas intermedias).

---

## Conclusión

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **CHECK** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **pingpong**.
