# Ejercicio 015 - carga de datos para biblioteca gamer

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **biblioteca gamer**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **carga de datos**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **carga de datos** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `estudios_desarrollo`
Almacena estudios y desarrolladoras de videojuegos.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estudio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudio |
| `nombre_estudio` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre de la compania |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de la sede |
| `fundacion` | `INT NOT NULL` | Ano de fundacion |

### Tabla Secundaria: `videojuegos_catalogo`
Almacena el catalogo de videojuegos con genero, precio y calificacion.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `estudios_desarrollo` y `videojuegos_catalogo` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `estudios_desarrollo` y posteriormente en `videojuegos_catalogo`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **carga de datos**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `carga de datos`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **carga de datos** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **biblioteca gamer**.
