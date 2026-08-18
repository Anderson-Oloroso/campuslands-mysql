# Ejercicio 038 - normalizacion 3FN para futbol sala

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **futbol sala**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 3FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 3FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `equipos_futsal`
Almacena equipos participantes en la liga de futbol sala 5v5.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_equipo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del equipo |
| `nombre` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del equipo de futsal |
| `sede` | `VARCHAR(50) NOT NULL` | Polideportivo local |
| `entrenador` | `VARCHAR(60) NOT NULL` | Director tecnico |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `jugadores_futsal`
Almacena los jugadores de futsal, sus posiciones y rendimiento.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `equipos_futsal` y `jugadores_futsal` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `equipos_futsal` y posteriormente en `jugadores_futsal`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 3FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 3FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 3FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **futbol sala**.
