# Ejercicio 017 - Tipos de datos para tienda de ropa

## Descripción y Objetivo

Este ejercicio implementa una solución de base de datos en MySQL para representar información básica de una tienda de ropa.

El objetivo principal es practicar la selección y utilización de diferentes tipos de datos en MySQL.

La solución utiliza una tabla principal denominada `productos`, que almacena información relacionada con las prendas y productos disponibles en la tienda.

La tabla permite almacenar:

* Identificador del producto.
* Nombre.
* Categoría.
* Talla.
* Precio.
* Cantidad disponible.
* Estado.
* Fecha de registro.

La solución fue diseñada de manera sencilla porque el ejercicio pertenece al nivel `Basico inicial`.

Se cumplen los requisitos indicados en el ejercicio:

* Uso exclusivo de MySQL.
* Nombres consistentes y descriptivos.
* Diferentes tipos de datos apropiados para cada campo.
* Restricciones para validar los datos.
* Más de 8 registros útiles.
* Más de 5 consultas.
* Filtros.
* Ordenamientos.
* Cálculos.
* Agrupaciones.
* Alias claros en consultas de reporte.
* Separación entre DDL, DML y DQL.

---

## Modelo de Datos y Estructura

La solución utiliza una tabla principal:

```text
productos
```

Esta tabla representa los productos que forman parte del inventario de la tienda.

### Tabla `productos`

| Columna          | Tipo de dato        | Descripción                        |
| ---------------- | ------------------- | ---------------------------------- |
| `id_producto`    | `INT UNSIGNED`      | Identificador único del producto.  |
| `nombre`         | `VARCHAR(100)`      | Nombre de la prenda o producto.    |
| `categoria`      | `VARCHAR(50)`       | Categoría del producto.            |
| `talla`          | `VARCHAR(10)`       | Talla del producto.                |
| `precio`         | `DECIMAL(10,2)`     | Precio del producto.               |
| `cantidad_stock` | `SMALLINT UNSIGNED` | Cantidad disponible en inventario. |
| `estado`         | `ENUM`              | Estado actual del producto.        |
| `fecha_registro` | `DATE`              | Fecha de registro del producto.    |

---

## Tipos de datos utilizados

### `INT UNSIGNED`

Se utiliza para `id_producto`.

Los identificadores son valores enteros positivos, por lo que `INT UNSIGNED` resulta apropiado.

Además, `AUTO_INCREMENT` permite generar automáticamente nuevos identificadores.

---

### `VARCHAR`

Se utiliza para almacenar información textual como:

* Nombre.
* Categoría.
* Talla.

Se utilizan longitudes diferentes dependiendo del tipo de información.

Por ejemplo:

```sql
nombre VARCHAR(100)
```

permite almacenar nombres de productos relativamente largos.

---

### `DECIMAL(10,2)`

Se utiliza para:

```text
precio
```

El precio representa un valor monetario, por lo que `DECIMAL` es apropiado para conservar precisión decimal.

La definición:

```sql
DECIMAL(10,2)
```

permite almacenar hasta 10 dígitos, incluyendo 2 posiciones decimales.

---

### `SMALLINT UNSIGNED`

Se utiliza para:

```text
cantidad_stock
```

Este campo representa el número de unidades disponibles.

Se utiliza un tipo entero porque no se necesitan valores decimales para contar unidades.

---

### `ENUM`

El campo `estado` utiliza:

```sql
ENUM('disponible', 'agotado')
```

Esto limita los valores posibles del estado.

---

### `DATE`

La columna:

```text
fecha_registro
```

utiliza `DATE` porque únicamente interesa almacenar la fecha de registro.

No es necesario almacenar la hora para cumplir con los requisitos del ejercicio.

---

## Restricciones

### Clave primaria

```sql
PRIMARY KEY
```

La columna `id_producto` identifica de forma única cada producto.

### `NOT NULL`

Se utiliza en los campos que deben contener información.

### `UNIQUE`

Se utiliza una restricción compuesta:

```sql
UNIQUE (nombre, talla)
```

Esto evita registrar dos productos con exactamente el mismo nombre y talla.

### `CHECK` del precio

```sql
CHECK (precio > 0)
```

Evita precios iguales o menores que cero.

### `CHECK` del stock

```sql
CHECK (cantidad_stock >= 0)
```

Evita cantidades negativas de inventario.

---

## Instrucciones de Ejecución Paso a Paso

## 1. Ubicar el proyecto

Desde PowerShell, ubicarse en la carpeta raíz del repositorio:

```powershell
cd campuslands-mysql
```

La solución se encuentra en:

```text
basico/ejercicio-017/resoluciones/pablo-lopez/
```

---

## 2. Ejecutar el DDL

Primero se ejecuta:

```text
ddl/schema.sql
```

Este archivo crea la base de datos `campuslands_mysql` si no existe y crea la tabla `productos`.

Desde PowerShell se puede ejecutar:

```powershell
mysql -u root -p < ./basico/ejercicio-017/resoluciones/pablo-lopez/ddl/schema.sql
```

Después se puede verificar desde MySQL:

```sql
USE campuslands_mysql;

SHOW TABLES;

DESCRIBE productos;
```

La tabla `productos` debe aparecer correctamente.

---

## 3. Ejecutar el DML

Después se ejecuta:

```text
dml/inserts.sql
```

Desde PowerShell:

```powershell
mysql -u root -p < ./basico/ejercicio-017/resoluciones/pablo-lopez/dml/inserts.sql
```

La solución contiene 12 productos.

Para comprobarlo:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

El resultado debe ser:

```text
12
```

---

## 4. Ejecutar el DQL

Finalmente se ejecuta:

```text
dql/consultas.sql
```

Desde PowerShell:

```powershell
mysql -u root -p < ./basico/ejercicio-017/resoluciones/pablo-lopez/dql/consultas.sql
```

Las consultas permiten comprobar filtros, ordenamientos, cálculos y agrupaciones.

El orden obligatorio es:

```text
DDL → DML → DQL
```

---

## Decisiones Técnicas y Arquitectura

### Uso de MySQL

La solución utiliza exclusivamente MySQL, tal como exige el ejercicio.

La base utilizada es:

```text
campuslands_mysql
```

### Diseño de una entidad principal

El README indica identificar una entidad principal.

Por ello se utiliza:

```text
productos
```

como entidad principal.

No se agregaron tablas de clientes, pedidos, empleados u otras entidades porque el ejercicio no las exige y pertenece al nivel básico inicial.

### Selección de tipos de datos

Los tipos fueron elegidos según la naturaleza de la información:

* `INT UNSIGNED` para identificadores.
* `VARCHAR` para textos.
* `DECIMAL` para precios.
* `SMALLINT UNSIGNED` para cantidades.
* `ENUM` para estados.
* `DATE` para fechas.

Esto permite demostrar directamente el objetivo principal del ejercicio: trabajar correctamente con tipos de datos de MySQL.

### Uso de `DECIMAL`

Los precios utilizan `DECIMAL(10,2)` porque representan valores monetarios.

Esto evita utilizar tipos aproximados para cantidades que requieren precisión decimal.

### Uso de `DATE`

La fecha de registro se almacena como `DATE` porque no se requiere información horaria.

### Validaciones

Se utilizan `CHECK` para evitar valores inválidos:

```sql
CHECK (precio > 0)
```

y:

```sql
CHECK (cantidad_stock >= 0)
```

Esto proporciona una validación relacionada directamente con la información de una tienda.

---

## Desglose de Consultas (DQL)

### Consulta 1 - Productos disponibles

Filtra los productos cuyo estado es `disponible`.

Permite responder:

> ¿Qué productos están disponibles actualmente?

Los resultados se ordenan alfabéticamente.

---

### Consulta 2 - Productos ordenados por precio

Muestra los productos desde el precio más alto hasta el más bajo.

Permite analizar rápidamente los productos de mayor valor.

También utiliza alias para hacer más claro el resultado:

```sql
nombre AS producto
precio AS precio_producto
```

---

### Consulta 3 - Top 5 productos

Muestra los cinco productos disponibles con mayor precio.

Utiliza:

```sql
ORDER BY precio DESC
LIMIT 5
```

Esto implementa la pista opcional del ejercicio sobre crear un ranking o Top 5.

---

### Consulta 4 - Cantidad por categoría

Utiliza:

```sql
COUNT(*)
GROUP BY categoria
```

para determinar cuántos productos existen en cada categoría.

---

### Consulta 5 - Precio promedio por categoría

Utiliza:

```sql
AVG(precio)
```

para calcular el precio promedio de los productos de cada categoría.

También utiliza `COUNT()` para indicar cuántos productos forman parte de cada categoría.

---

### Consulta 6 - Valor del inventario

Esta consulta utiliza:

```sql
COUNT()
SUM()
```

y calcula el valor total estimado del inventario disponible mediante:

```sql
SUM(precio * cantidad_stock)
```

También muestra la cantidad de productos y unidades disponibles.

Esta consulta permite demostrar el uso de tipos numéricos y operaciones matemáticas sobre ellos.

---

### Consulta 7 - Productos con stock bajo

Filtra productos disponibles cuya cantidad de stock sea menor o igual a 10.

Permite identificar productos que tienen pocas unidades disponibles.

También ordena los resultados desde el menor stock.

---

### Consulta 8 - Categorías con mínimo dos productos

Agrupa los productos por categoría y utiliza `HAVING` para mostrar únicamente categorías que tienen al menos dos productos.

También calcula el precio promedio de cada categoría.

---

## Validación de la Solución

### Validación del DDL

Ejecutar:

```sql
USE campuslands_mysql;

SHOW TABLES;

DESCRIBE productos;
```

Debe existir la tabla `productos`.

---

### Validación de los datos

Ejecutar:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

La solución contiene 12 registros.

---

### Validación de los filtros

Comprobar las consultas relacionadas con:

* Estado.
* Precio.
* Stock.

---

### Validación de los ordenamientos

Comprobar que los productos aparecen correctamente ordenados por:

* Nombre.
* Precio.
* Stock.

---

### Validación de los cálculos

Comprobar resultados de:

* `COUNT()`.
* `SUM()`.
* `AVG()`.
* Multiplicación de precio por cantidad de stock.

---

### Validación final con Git

Desde PowerShell ejecutar:

```powershell
git status
```

Verificar que únicamente se hayan creado o modificado archivos dentro de:

```text
basico/ejercicio-017/resoluciones/pablo-lopez/
```

No se deben modificar:

* `plantilla/`
* README base del ejercicio.
* Resoluciones de otros estudiantes.

El Pull Request debe dirigirse hacia:

```text
dev
```
