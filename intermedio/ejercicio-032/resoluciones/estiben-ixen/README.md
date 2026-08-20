# Ejercicio 032 - LEFT JOIN para ranking battle royale

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **ranking battle royale**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **LEFT JOIN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **LEFT JOIN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `jugadores_br`
Almacena los perfiles de jugadores del battle royale.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del jugador |
| `nickname` | `VARCHAR(40) NOT NULL UNIQUE` | Alias en el juego |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de origen |
| `nivel` | `INT NOT NULL DEFAULT 1` | Nivel de cuenta |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado del jugador |

### Tabla Secundaria: `partidas_br`
Registra las partidas disputadas y resultados de cada jugador.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_partida` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de partida |
| `id_jugador` | `INT NOT NULL` | Llave foranea a jugadores |
| `mapa` | `VARCHAR(40) NOT NULL` | Mapa donde se jugo |
| `posicion` | `INT NOT NULL` | Puesto final obtenido (1 a 100) |
| `eliminaciones` | `INT NOT NULL DEFAULT 0` | Bajas conseguidas |
| `puntos` | `DECIMAL(8,2) NOT NULL DEFAULT 0` | Puntos ganados en la partida |
| `fecha_partida` | `DATETIME NOT NULL` | Fecha y hora de la partida |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `jugadores_br` y `partidas_br` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `jugadores_br` y posteriormente en `partidas_br`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **LEFT JOIN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `LEFT JOIN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **LEFT JOIN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **ranking battle royale**.
