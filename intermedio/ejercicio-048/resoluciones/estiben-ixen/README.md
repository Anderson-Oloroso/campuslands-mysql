# Ejercicio 048 - GROUP BY para viajes y turismo

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **viajes y turismo**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **GROUP BY**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **GROUP BY** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `destinos_turisticos`
Almacena paises, regiones y ciudades turisticas del mundo.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_destino` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del destino |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad turistica |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de ubicacion |
| `continente` | `ENUM('America','Europa','Asia','Africa','Oceania') NOT NULL` | Continente |
| `clima` | `ENUM('Tropical','Templado','Frio','Desertico') NOT NULL` | Campo clima |

### Tabla Secundaria: `paquetes_turisticos`
Almacena tours, experiencias y paquetes vacacionales organizados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_paquete` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del paquete |
| `nombre_paquete` | `VARCHAR(90) NOT NULL` | Nombre del tour |
| `id_destino` | `INT NOT NULL` | Destino principal |
| `duracion_dias` | `INT NOT NULL` | Cantidad de noches y dias |
| `precio_por_persona` | `DECIMAL(8,2) NOT NULL` | Precio en USD |
| `cupos_maximos` | `INT NOT NULL` | Capacidad por grupo |
| `nivel_dificultad` | `ENUM('Facil','Moderado','Exigente') DEFAULT 'Facil'` | Exigencia fisica |
| `incluye_vuelo` | `ENUM('Si','No') DEFAULT 'Si'` | Campo incluye_vuelo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `destinos_turisticos` y `paquetes_turisticos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `destinos_turisticos` y posteriormente en `paquetes_turisticos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **GROUP BY**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `GROUP BY`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **GROUP BY** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **viajes y turismo**.
