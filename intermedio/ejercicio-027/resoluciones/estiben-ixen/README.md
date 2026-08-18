# Ejercicio 027 - consultas de reportes para videojuego de accion y aventura

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **videojuego de accion y aventura**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **consultas de reportes**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **consultas de reportes** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `reinos_aventura`
Almacena regiones y reinos explorables en el mundo abierto.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_reino` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del territorio |
| `nombre_reino` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del mapa o comarca |
| `clima_dominante` | `ENUM('Bosque Elfico','Tierras Altas Nevadas','Volcanico Arido','Ruinas Sumergidas','Desierto Maldito') NOT NULL` | Bioma |
| `nivel_peligro` | `INT NOT NULL DEFAULT 1` | Nivel de amenaza (1-10) |

### Tabla Secundaria: `artefactos_magicos`
Almacena reliquias, armas ancestrales, poder magico y ubicacion de encuentro.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `reinos_aventura` y `artefactos_magicos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `reinos_aventura` y posteriormente en `artefactos_magicos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **consultas de reportes**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `consultas de reportes`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **consultas de reportes** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **videojuego de accion y aventura**.
