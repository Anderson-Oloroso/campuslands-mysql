# Ejercicio 012 - consultas de reportes para playlist musical

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **playlist musical**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **consultas de reportes**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **consultas de reportes** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `artistas_musicales`
Almacena interpretes, bandas y solistas musicales.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artista` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del artista |
| `nombre_artistico` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre comercial |
| `pais_origen` | `VARCHAR(40) NOT NULL` | Pais de nacimiento o base |
| `oyentes_mensuales` | `BIGINT NOT NULL DEFAULT 0` | Oyentes mensuales en streaming |
| `estado` | `ENUM('Activo','Pausa','Retirado') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `canciones_playlist`
Almacena pistas de audio, generos, duracion y reproducciones de canciones.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_cancion` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del track |
| `titulo` | `VARCHAR(80) NOT NULL` | Titulo de la pista |
| `id_artista` | `INT NOT NULL` | Artista creador |
| `genero` | `ENUM('Rock','Pop','Electronica','Hip Hop','Reggaeton','Indie','Jazz') NOT NULL` | Genero musical |
| `duracion_segundos` | `INT NOT NULL` | Longitud del track en segundos |
| `reproducciones` | `BIGINT NOT NULL DEFAULT 0` | Streams totales acumulados |
| `bpm` | `INT NOT NULL DEFAULT 120` | Tempo en beats por minuto |
| `fecha_lanzamiento` | `DATE NOT NULL` | Fecha oficial de salida |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `artistas_musicales` y `canciones_playlist` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `artistas_musicales` y posteriormente en `canciones_playlist`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **consultas de reportes** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **playlist musical**.
