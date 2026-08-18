# Ejercicio 026 - CHECK para videojuego RPG

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **videojuego RPG**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **CHECK**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **CHECK** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `clases_personaje_rpg`
Almacena arquetipos y clases de combate del juego de rol.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_clase` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la clase |
| `nombre_clase` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del arquetipo |
| `atributo_principal` | `ENUM('Fuerza','Destreza','Inteligencia','Fe','Vitalidad') NOT NULL` | Estadistica clave |
| `rol_combate` | `ENUM('Tanque','DPS Fisico','DPS Magico','Sanador/Support') NOT NULL` | Campo rol_combate |

### Tabla Secundaria: `heroes_rpg`
Almacena heroes, niveles, puntos de vida/mana y oro acumulado.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `clases_personaje_rpg` y `heroes_rpg` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `clases_personaje_rpg` y posteriormente en `heroes_rpg`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **CHECK** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **videojuego RPG**.
