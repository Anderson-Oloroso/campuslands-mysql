# Ejercicio 015 - Relaciones simples para biblioteca gamer

## Descripción y Objetivo

Este ejercicio implementa una base de datos sencilla para representar una biblioteca gamer utilizando MySQL.

El objetivo principal es practicar relaciones simples entre tablas, creación de estructuras mediante DDL, inserción de datos mediante DML y elaboración de consultas mediante DQL.

La solución fue diseñada para ejecutarse desde cero y mantener una separación clara de responsabilidades entre los archivos SQL.

La estructura utiliza dos entidades principales:

* `categorias`: almacena las categorías de los videojuegos.
* `juegos`: almacena la información de cada videojuego y mantiene una relación con su categoría.

La solución cumple los requisitos mínimos del ejercicio:

* Utiliza exclusivamente MySQL.
* Utiliza nombres claros y consistentes.
* Incluye restricciones relacionadas con los datos.
* Contiene más de 8 registros útiles.
* Contiene más de 5 consultas.
* Permite realizar filtros.
* Permite realizar ordenamientos.
* Permite realizar cálculos mediante funciones de agregación.
* Incluye una relación mediante clave foránea.
* Separa DDL, DML y DQL en archivos independientes.

---

## Modelo de Datos y Estructura

### Tabla `categorias`

La tabla `categorias` representa las diferentes categorías disponibles dentro de la biblioteca gamer.

| Columna        | Tipo           | Descripción                          |
| -------------- | -------------- | ------------------------------------ |
| `id_categoria` | `INT UNSIGNED` | Identificador único de la categoría. |
| `nombre`       | `VARCHAR(50)`  | Nombre de la categoría.              |

### Restricciones

* `id_categoria` es la clave primaria.
* `nombre` es obligatorio mediante `NOT NULL`.
* `nombre` utiliza `UNIQUE` para evitar categorías repetidas.

---

### Tabla `juegos`

La tabla `juegos` almacena la información principal de los videojuegos.

| Columna             | Tipo            | Descripción                               |
| ------------------- | --------------- | ----------------------------------------- |
| `id_juego`          | `INT UNSIGNED`  | Identificador único del juego.            |
| `titulo`            | `VARCHAR(100)`  | Nombre del videojuego.                    |
| `plataforma`        | `VARCHAR(50)`   | Plataforma en la que está disponible.     |
| `puntaje`           | `DECIMAL(3,1)`  | Puntaje del videojuego entre 0 y 10.      |
| `precio`            | `DECIMAL(10,2)` | Precio del videojuego.                    |
| `fecha_lanzamiento` | `DATE`          | Fecha de lanzamiento.                     |
| `estado`            | `ENUM`          | Estado del videojuego: activo o inactivo. |
| `id_categoria`      | `INT UNSIGNED`  | Referencia a la categoría del videojuego. |

### Restricciones

* `id_juego` es la clave primaria.
* Los datos principales utilizan `NOT NULL`.
* `puntaje` posee un `CHECK` que permite valores entre `0.0` y `10.0`.
* `precio` posee un `CHECK` que impide valores negativos.
* `estado` solamente permite los valores `activo` e `inactivo`.
* `id_categoria` es una clave foránea.
* La clave foránea evita que un juego sea asociado a una categoría inexistente.

---

## Relación entre las tablas

La relación implementada es:

`categorias (1) ---- (N) juegos`

Una categoría puede estar asociada con varios videojuegos.

Por ejemplo, la categoría `Acción` puede tener varios juegos, mientras que cada juego solamente tiene una categoría asignada.

La relación se implementa mediante:

```sql
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria)
```

Esto permite realizar consultas utilizando `INNER JOIN` y `LEFT JOIN`.

---

## Instrucciones de Ejecución Paso a Paso

### 1. Preparar la base de datos

Desde el directorio raíz del repositorio se debe acceder al directorio correspondiente:

```bash
cd campuslands-mysql
```

La solución se encuentra en:

```text
basico/ejercicio-015/resoluciones/pablo-lopez/
```

---

### 2. Ejecutar el DDL

Primero se debe ejecutar:

```text
ddl/schema.sql
```

El script crea la base de datos `campuslands_mysql` si todavía no existe y posteriormente crea las tablas `categorias` y `juegos`.

Ejemplo:

```bash
mysql -u root -p < basico/ejercicio-015/resoluciones/pablo-lopez/ddl/schema.sql
```

---

### 3. Ejecutar el DML

Después de crear las tablas se ejecuta:

```text
dml/inserts.sql
```

Ejemplo:

```bash
mysql -u root -p < basico/ejercicio-015/resoluciones/pablo-lopez/dml/inserts.sql
```

Este archivo inserta:

* 5 categorías.
* 10 videojuegos.

Los registros incluyen diferentes plataformas, puntajes, precios, fechas y estados para permitir la comprobación de las consultas.

---

### 4. Ejecutar el DQL

Finalmente se ejecuta:

```text
dql/consultas.sql
```

Ejemplo:

```bash
mysql -u root -p < basico/ejercicio-015/resoluciones/pablo-lopez/dql/consultas.sql
```

También se pueden ejecutar los archivos desde el cliente de MySQL:

```sql
SOURCE basico/ejercicio-015/resoluciones/pablo-lopez/ddl/schema.sql;
SOURCE basico/ejercicio-015/resoluciones/pablo-lopez/dml/inserts.sql;
SOURCE basico/ejercicio-015/resoluciones/pablo-lopez/dql/consultas.sql;
```

El orden correcto es siempre:

```text
DDL → DML → DQL
```

---

## Decisiones Técnicas y Arquitectura

### Uso de MySQL

La solución utiliza exclusivamente MySQL porque es el sistema gestor indicado por el ejercicio.

La base utilizada es:

```sql
campuslands_mysql
```

Esto permite mantener la solución integrada con el entorno del repositorio.

### Separación de responsabilidades

Los archivos se separan según su función:

```text
ddl/
└── schema.sql
```

Contiene la estructura de la base de datos.

```text
dml/
└── inserts.sql
```

Contiene los registros iniciales.

```text
dql/
└── consultas.sql
```

Contiene las consultas utilizadas para comprobar y analizar los datos.

Esta organización facilita la revisión por otro desarrollador.

### Normalización y relaciones

La categoría de un videojuego se almacena una sola vez en la tabla `categorias`.

Los videojuegos almacenan solamente el identificador de la categoría mediante `id_categoria`.

Esto evita repetir constantemente el nombre de la categoría en cada registro y permite establecer una relación mediante una clave foránea.

### Restricciones

Se utilizan restricciones para mantener la integridad de los datos.

El puntaje se limita mediante:

```sql
CHECK (puntaje BETWEEN 0.0 AND 10.0)
```

El precio se limita mediante:

```sql
CHECK (precio >= 0)
```

Además, la clave foránea garantiza que todos los juegos tengan una categoría existente.

### Características SQL utilizadas

La solución utiliza características apropiadas para un ejercicio básico:

* `CREATE DATABASE`
* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `NOT NULL`
* `UNIQUE`
* `CHECK`
* `ENUM`
* `INSERT`
* `SELECT`
* `WHERE`
* `INNER JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `COUNT`
* `SUM`
* `AVG`
* `ROUND`

No se utilizan características avanzadas innecesarias para mantener la solución acorde con la dificultad básica del ejercicio.

---

## Desglose de Consultas (DQL)

### Consulta 1 - Juegos activos ordenados por puntaje

Filtra únicamente los videojuegos cuyo estado es `activo` y los ordena desde el mayor puntaje hasta el menor.

Permite identificar rápidamente los videojuegos activos mejor valorados.

---

### Consulta 2 - Juegos con su categoría

Utiliza `INNER JOIN` para relacionar `juegos` con `categorias`.

Permite comprobar directamente que la relación entre ambas tablas funciona correctamente.

---

### Consulta 3 - Top 5 videojuegos

Filtra los juegos activos, los ordena por puntaje descendente y utiliza `LIMIT 5`.

Responde a la pregunta:

> ¿Cuáles son los cinco videojuegos activos con mayor puntaje?

---

### Consulta 4 - Cantidad de juegos por categoría

Utiliza `LEFT JOIN` y `COUNT()` para determinar cuántos videojuegos activos existen en cada categoría.

El `LEFT JOIN` permite conservar también las categorías que eventualmente no tengan juegos activos.

---

### Consulta 5 - Puntaje promedio por categoría

Utiliza `AVG()` para calcular el puntaje promedio de los videojuegos activos de cada categoría.

También utiliza `COUNT()` para mostrar cuántos juegos participan en cada promedio.

Los resultados se ordenan desde el promedio más alto hasta el más bajo.

---

### Consulta 6 - Valor total de la biblioteca

Utiliza:

```sql
COUNT()
SUM()
```

para calcular:

* Cantidad total de videojuegos activos.
* Valor total de los videojuegos activos.

Esto permite comprobar cálculos sobre los datos almacenados.

---

### Consulta 7 - Juegos con precio menor a 50

Utiliza `WHERE` para filtrar videojuegos activos cuyo precio sea menor a `50.00`.

Después utiliza `ORDER BY` para mostrar primero los videojuegos de menor precio.

Esta consulta permite comprobar el requisito de filtros y ordenamientos.

---

### Consulta 8 - Categorías con al menos dos juegos

Agrupa los videojuegos por categoría y utiliza `HAVING` para conservar únicamente aquellas categorías que tengan al menos dos videojuegos.

Esto permite demostrar una consulta de agrupación con una condición sobre el resultado agregado.

---

## Validación de la solución

Para comprobar que el ejercicio está correctamente implementado se debe verificar:

1. `schema.sql` se ejecuta sin errores.
2. Las tablas `categorias` y `juegos` fueron creadas.
3. `inserts.sql` inserta correctamente los registros.
4. Las claves foráneas funcionan correctamente.
5. Las restricciones de puntaje y precio se encuentran activas.
6. `consultas.sql` se ejecuta sin errores.
7. Las consultas muestran resultados útiles.
8. Los filtros funcionan.
9. Los ordenamientos funcionan.
10. Los cálculos de `COUNT`, `SUM` y `AVG` producen resultados.
11. La relación entre categorías y juegos puede comprobarse mediante los `JOIN`.
12. La carpeta se encuentra dentro de `resoluciones/pablo-lopez/`.

---

## Orden final de ejecución

```text
1. ddl/schema.sql
2. dml/inserts.sql
3. dql/consultas.sql
```

La solución mantiene separadas las responsabilidades y puede ejecutarse desde cero sobre MySQL.
