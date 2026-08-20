# Ejercicio 016 - CREATE TABLE para restaurante de comida urbana

## Descripción y Objetivo

Este ejercicio implementa una solución de base de datos en MySQL inspirada en un restaurante de comida urbana.

El objetivo principal es practicar la creación de tablas mediante `CREATE TABLE`, además de trabajar con inserción de datos y consultas que permitan comprobar que la estructura creada funciona correctamente.

La solución utiliza una entidad principal llamada `productos`, encargada de almacenar los productos disponibles en el restaurante.

Cada registro contiene información sobre:

* Nombre del producto.
* Categoría.
* Precio.
* Estado de disponibilidad.
* Fecha de alta.

La estructura fue diseñada para ser sencilla, clara y apropiada para el nivel básico inicial del ejercicio.

La solución cumple los requisitos establecidos:

* Utiliza MySQL.
* Utiliza nombres descriptivos.
* Implementa restricciones relacionadas con los datos.
* Contiene más de 8 registros.
* Contiene más de 5 consultas.
* Permite realizar filtros.
* Permite ordenar información.
* Permite realizar cálculos mediante funciones de agregación.
* Utiliza alias claros en consultas de reporte.
* Separa DDL, DML y DQL.

---

## Modelo de Datos y Estructura

La solución utiliza una tabla principal:

```text
productos
```

La tabla representa los productos que forman parte del menú del restaurante.

### Tabla `productos`

| Columna       | Tipo            | Descripción                                 |
| ------------- | --------------- | ------------------------------------------- |
| `id_producto` | `INT UNSIGNED`  | Identificador único del producto.           |
| `nombre`      | `VARCHAR(100)`  | Nombre del producto.                        |
| `categoria`   | `VARCHAR(50)`   | Categoría a la que pertenece el producto.   |
| `precio`      | `DECIMAL(10,2)` | Precio del producto.                        |
| `estado`      | `ENUM`          | Indica si el producto está disponible.      |
| `fecha_alta`  | `DATE`          | Fecha en la que el producto fue registrado. |

### Clave primaria

La columna:

```sql
id_producto
```

es la clave primaria de la tabla.

Se utiliza `AUTO_INCREMENT` para generar automáticamente un identificador para cada nuevo producto.

### Restricción `NOT NULL`

Las columnas principales se definieron con `NOT NULL` para evitar registros incompletos.

### Restricción `CHECK`

El precio utiliza:

```sql
CHECK (precio > 0)
```

Esto evita registrar productos con precios inválidos.

### Restricción `UNIQUE`

El nombre del producto utiliza `UNIQUE`.

Esto evita que se registren dos productos con exactamente el mismo nombre.

### Estado

El estado utiliza:

```sql
ENUM('disponible', 'no_disponible')
```

Esto limita los valores posibles y facilita posteriormente los filtros.

---

## Instrucciones de Ejecución Paso a Paso

### 1. Ubicación del proyecto

Desde la raíz del repositorio:

```bash
cd campuslands-mysql
```

La resolución se encuentra en:

```text
basico/ejercicio-016/resoluciones/pablo-lopez/
```

---

### 2. Ejecutar el DDL

El primer archivo que debe ejecutarse es:

```text
ddl/schema.sql
```

Este archivo crea la base de datos `campuslands_mysql` si no existe y posteriormente crea la tabla `productos`.

Desde la terminal se puede ejecutar:

```bash
mysql -u root -p < basico/ejercicio-016/resoluciones/pablo-lopez/ddl/schema.sql
```

Si la ejecución termina sin errores, la estructura está creada correctamente.

También se puede comprobar con:

```sql
USE campuslands_mysql;

SHOW TABLES;
```

Y posteriormente:

```sql
DESCRIBE productos;
```

---

### 3. Ejecutar el DML

Después de crear la tabla se ejecuta:

```text
dml/inserts.sql
```

Desde la terminal:

```bash
mysql -u root -p < basico/ejercicio-016/resoluciones/pablo-lopez/dml/inserts.sql
```

El archivo inserta 12 productos.

Para verificar la cantidad de registros:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

El resultado esperado es:

```text
12
```

---

### 4. Ejecutar el DQL

Finalmente se ejecuta:

```text
dql/consultas.sql
```

Desde la terminal:

```bash
mysql -u root -p < basico/ejercicio-016/resoluciones/pablo-lopez/dql/consultas.sql
```

Las consultas permiten verificar filtros, ordenamientos, agrupaciones y cálculos.

El orden de ejecución es:

```text
DDL → DML → DQL
```

Nunca se debe intentar ejecutar primero el DML o DQL si la tabla todavía no existe.

---

## Decisiones Técnicas y Arquitectura

### Uso de MySQL

El ejercicio requiere específicamente MySQL, por lo que toda la solución utiliza sintaxis compatible con MySQL.

La base de datos utilizada es:

```text
campuslands_mysql
```

### Diseño sencillo

Debido a que el ejercicio pertenece a la categoría `Basico inicial`, se decidió utilizar una sola tabla.

No se agregaron tablas de clientes, pedidos, empleados, proveedores u otras entidades porque el README no las exige.

Esto evita introducir complejidad innecesaria.

### Uso de `DECIMAL`

El precio se almacena utilizando:

```sql
DECIMAL(10,2)
```

Este tipo es apropiado para valores monetarios porque permite almacenar dos posiciones decimales.

### Uso de `DATE`

La columna `fecha_alta` utiliza:

```sql
DATE
```

porque únicamente es necesario registrar la fecha del alta del producto y no una hora específica.

### Uso de `ENUM`

El campo `estado` utiliza:

```sql
ENUM('disponible', 'no_disponible')
```

Esto proporciona una validación sencilla y adecuada para el nivel del ejercicio.

### Integridad de datos

Las restricciones implementadas ayudan a evitar datos inválidos:

* Identificadores únicos mediante `PRIMARY KEY`.
* Campos obligatorios mediante `NOT NULL`.
* Precios positivos mediante `CHECK`.
* Productos sin nombres duplicados mediante `UNIQUE`.
* Estados controlados mediante `ENUM`.

---

## Desglose de Consultas (DQL)

### Consulta 1 - Productos disponibles

Muestra únicamente los productos cuyo estado es `disponible`.

Responde a la pregunta:

> ¿Qué productos están actualmente disponibles en el restaurante?

También ordena los resultados alfabéticamente por nombre.

---

### Consulta 2 - Productos ordenados por precio

Muestra todos los productos y los ordena desde el precio más alto hasta el más bajo.

Permite analizar cuáles son los productos de mayor precio.

Utiliza alias:

```sql
nombre AS producto
precio AS precio_producto
```

para mejorar la claridad del reporte.

---

### Consulta 3 - Top 5 productos

Muestra los cinco productos disponibles con mayor precio.

Utiliza:

```sql
ORDER BY precio DESC
LIMIT 5
```

Esto implementa la pista opcional del ejercicio relacionada con un ranking o `TOP 5`.

---

### Consulta 4 - Productos por categoría

Utiliza `COUNT()` y `GROUP BY` para calcular cuántos productos existen dentro de cada categoría.

Permite responder:

> ¿Qué categorías tienen más productos registrados?

---

### Consulta 5 - Precio promedio por categoría

Utiliza `AVG()` para calcular el precio promedio de cada categoría.

También utiliza `COUNT()` para conocer la cantidad de productos utilizados en cada cálculo.

La función `ROUND()` limita el resultado promedio a dos decimales.

---

### Consulta 6 - Valor total de productos disponibles

Utiliza:

```sql
COUNT()
SUM()
```

para obtener:

* Cantidad de productos disponibles.
* Suma total de sus precios.

Esto permite comprobar el requisito de realizar cálculos sobre los datos.

---

### Consulta 7 - Productos económicos

Filtra los productos disponibles cuyo precio sea menor o igual a `25.00`.

Después ordena los resultados de menor a mayor precio.

Permite demostrar directamente el uso de:

```sql
WHERE
ORDER BY
```

---

### Consulta 8 - Categorías con mínimo dos productos

Utiliza `GROUP BY` para agrupar productos por categoría y `HAVING` para conservar únicamente las categorías que tienen dos o más productos.

Permite comprobar una condición aplicada sobre un resultado agregado.

---

## Validación de la Solución

Para comprobar que el ejercicio funciona correctamente se debe realizar el siguiente proceso:

### DDL

Ejecutar:

```text
ddl/schema.sql
```

Y comprobar:

```sql
SHOW TABLES;

DESCRIBE productos;
```

No deben aparecer errores.

### DML

Ejecutar:

```text
dml/inserts.sql
```

Y comprobar:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

Debe existir un mínimo de 8 registros.

La solución proporciona 12.

### DQL

Ejecutar:

```text
dql/consultas.sql
```

Y comprobar que las 8 consultas devuelven resultados coherentes.

Se debe comprobar especialmente:

* Filtro por estado.
* Ordenamiento por precio.
* Ranking de productos.
* Conteo por categoría.
* Promedio por categoría.
* Suma de precios.
* Filtro por precio.
* Agrupación mediante `GROUP BY` y `HAVING`.

---

## Archivos de la Resolución

```text
ddl/schema.sql
```

Contiene la creación de la base de datos y tabla.

```text
dml/inserts.sql
```

Contiene los datos iniciales.

```text
dql/consultas.sql
```

Contiene las consultas de comprobación y análisis.

```text
evidencias/README.md
```

Contiene las instrucciones para documentar las evidencias de ejecución.

---

## Revisión antes del commit

Antes de realizar el commit se debe ejecutar:

```bash
git status
```

Se debe comprobar que únicamente se modificaron o agregaron archivos correspondientes a:

```text
basico/ejercicio-016/resoluciones/pablo-lopez/
```

No se debe modificar:

* `plantilla/`
* README base del ejercicio.
* Resoluciones de otros estudiantes.

El Pull Request debe dirigirse a la rama:

```text
dev
```
