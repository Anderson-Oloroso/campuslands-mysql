# Ejercicio 021 - normalizacion 1FN para dibujo digital

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **dibujo digital**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 1FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 1FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `ilustradores_digitales`
Almacena perfiles de artistas visuales e ilustradores digitales.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_ilustrador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del artista |
| `nombre_artistico` | `VARCHAR(60) NOT NULL UNIQUE` | Alias en plataformas de arte |
| `software_preferido` | `ENUM('Photoshop','Procreate','Clip Studio Paint','Krita','Blender Grease Pencil') NOT NULL` | Software principal |
| `seguidores` | `INT NOT NULL DEFAULT 0` | Comunidad en redes |

### Tabla Secundaria: `obras_digitales`
Almacena pinturas digitales, resoluciones, capas y programas utilizados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_obra` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la pieza digital |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la obra |
| `id_ilustrador` | `INT NOT NULL` | Artista creador |
| `estilo` | `ENUM('Concept Art','Anime/Manga','Splash Art','Pixel Art','Retrato Semirrealista') NOT NULL` | Estilo visual |
| `cantidad_capas` | `INT NOT NULL` | Total de capas en el archivo .psd/.clip |
| `ancho_px` | `INT NOT NULL` | Resolucion horizontal |
| `alto_px` | `INT NOT NULL` | Resolucion vertical |
| `precio_comision` | `DECIMAL(7,2) NOT NULL` | Costo en USD |
| `fecha_creacion` | `DATE NOT NULL` | Fecha de finalizacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `ilustradores_digitales` y `obras_digitales` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `ilustradores_digitales` y posteriormente en `obras_digitales`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 1FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 1FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 1FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **dibujo digital**.
