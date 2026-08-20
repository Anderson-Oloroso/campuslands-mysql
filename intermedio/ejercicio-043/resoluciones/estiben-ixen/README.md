# Ejercicio 043 - tablas puente para catalogo de peliculas de miedo

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **catalogo de peliculas de miedo**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **tablas puente**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **tablas puente** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `directores_terror`
Almacena cineastas especializados en el genero de terror y suspense.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_director` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del director |
| `nombre` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del cineasta |
| `nacionalidad` | `VARCHAR(40) NOT NULL` | Pais de origen |
| `premios_obtenidos` | `INT NOT NULL DEFAULT 0` | Galardones en festivales de cine |

### Tabla Secundaria: `peliculas_terror`
Almacena peliculas de miedo con su presupuesto, taquilla y clasificacion.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_pelicula` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del filme |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo oficial de la pelicula |
| `id_director` | `INT NOT NULL` | Director a cargo |
| `subgenero` | `ENUM('Sobrenatural','Slasher','Psicologico','Gore','Monstruos','Cosmico') NOT NULL` | Subgenero de terror |
| `duracion_min` | `INT NOT NULL` | Duracion en minutos |
| `presupuesto_millones` | `DECIMAL(6,2) NOT NULL` | Presupuesto de produccion en USD |
| `taquilla_millones` | `DECIMAL(6,2) NOT NULL` | Recaudacion global en USD |
| `clasificacion_edad` | `ENUM('PG-13','R','NC-17') NOT NULL` | Clasificacion de edad |
| `estreno_anio` | `INT NOT NULL` | Ano de lanzamiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `directores_terror` y `peliculas_terror` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `directores_terror` y posteriormente en `peliculas_terror`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **tablas puente**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `tablas puente`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **tablas puente** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **catalogo de peliculas de miedo**.
