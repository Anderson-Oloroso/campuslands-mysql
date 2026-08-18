# Ejercicio 031 - INNER JOIN para torneo esports MOBA

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **torneo esports MOBA**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **INNER JOIN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **INNER JOIN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `escuadras`
Almacena las escuadras o equipos participantes en el torneo MOBA.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_escuadra` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de la escuadra |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre oficial del equipo |
| `region` | `VARCHAR(40) NOT NULL` | Region competitiva |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado de participacion |

### Tabla Secundaria: `jugadores_moba`
Almacena los jugadores registrados por escuadra en el torneo.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del jugador |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre real del jugador |
| `nickname` | `VARCHAR(40) NOT NULL UNIQUE` | Nombre de invocador / alias |
| `rol` | `ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL` | Posicion de juego |
| `id_escuadra` | `INT NOT NULL` | Llave foranea a escuadras |
| `puntaje` | `DECIMAL(6,2) DEFAULT 0` | Puntaje acumulado de rendimiento |
| `estado` | `ENUM('activo','inactivo') DEFAULT 'activo'` | Disponibilidad del jugador |
| `fecha_registro` | `DATE NOT NULL` | Fecha de ingreso al torneo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `escuadras` y `jugadores_moba` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `escuadras` y posteriormente en `jugadores_moba`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **INNER JOIN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `INNER JOIN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **INNER JOIN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **torneo esports MOBA**.
