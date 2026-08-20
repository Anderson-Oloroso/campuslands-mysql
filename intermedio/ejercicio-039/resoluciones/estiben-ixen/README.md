# Ejercicio 039 - FOREIGN KEY para kickboxing

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **kickboxing**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **FOREIGN KEY**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **FOREIGN KEY** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `gimnasios_kb`
Almacena academias y dojos de kickboxing y muay thai.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_gimnasio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la academia |
| `nombre` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del dojo/gym |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad de entrenamiento |
| `entrenador_principal` | `VARCHAR(60) NOT NULL` | Coach principal |

### Tabla Secundaria: `peleadores_kb`
Almacena peleadores profesionales con su record de combates.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_peleador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del luchador |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre completo |
| `apodo` | `VARCHAR(40) NOT NULL` | Alias de combate |
| `categoria_peso` | `ENUM('Peso Mosca','Peso Pluma','Peso Ligero','Peso Welter','Peso Mediano','Peso Pesado') NOT NULL` | Division de peso |
| `id_gimnasio` | `INT NOT NULL` | Gimnasio de representacion |
| `victorias` | `INT NOT NULL DEFAULT 0` | Peleas ganadas |
| `nocauts` | `INT NOT NULL DEFAULT 0` | Victorias por KO/TKO |
| `derrotas` | `INT NOT NULL DEFAULT 0` | Peleas perdidas |
| `estilo` | `ENUM('Holandes','Muay Thai','Americano','K-1') NOT NULL` | Estilo principal |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `gimnasios_kb` y `peleadores_kb` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `gimnasios_kb` y posteriormente en `peleadores_kb`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **FOREIGN KEY**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `FOREIGN KEY`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **FOREIGN KEY** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **kickboxing**.
