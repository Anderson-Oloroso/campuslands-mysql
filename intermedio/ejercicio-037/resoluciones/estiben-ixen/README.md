# Ejercicio 037 - normalizacion 2FN para liga de futbol

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **liga de futbol**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 2FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 2FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `clubes_futbol`
Almacena los clubes que compiten en el torneo de liga.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_club` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del club |
| `nombre_club` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre oficial del equipo |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad sede |
| `estadio` | `VARCHAR(60) NOT NULL` | Nombre del estadio |
| `fundacion` | `INT NOT NULL` | Ano de fundacion |

### Tabla Secundaria: `futbolistas`
Almacena las plantillas de jugadores de cada club de futbol.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del futbolista |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre completo |
| `posicion` | `ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL` | Demarcacion tactica |
| `numero_camiseta` | `INT NOT NULL` | Dorsal oficial |
| `id_club` | `INT NOT NULL` | Club al que pertenece |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles anotados en la temporada |
| `asistencias` | `INT NOT NULL DEFAULT 0` | Pases de gol |
| `salario_mensual` | `DECIMAL(10,2) NOT NULL` | Sueldo mensual en USD |
| `estado` | `ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `clubes_futbol` y `futbolistas` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `clubes_futbol` y posteriormente en `futbolistas`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 2FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 2FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 2FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **liga de futbol**.
