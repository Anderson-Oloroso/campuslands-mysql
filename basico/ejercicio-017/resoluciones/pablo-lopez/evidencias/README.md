# Evidencias - Ejercicio 017

## Objetivo

Esta carpeta contiene la documentación necesaria para demostrar que la solución del ejercicio fue ejecutada correctamente.

Las evidencias deben demostrar:

* Creación de la tabla.
* Tipos de datos utilizados.
* Restricciones.
* Inserción de registros.
* Ejecución de consultas.
* Resultados importantes.

No es necesario guardar capturas innecesarias.

---

## 1. Evidencia del DDL

Ejecutar:

```text
ddl/schema.sql
```

Después:

```sql
USE campuslands_mysql;

SHOW TABLES;
```

La evidencia debe mostrar que existe la tabla:

```text
productos
```

---

## 2. Evidencia de los tipos de datos

Ejecutar:

```sql
DESCRIBE productos;
```

La captura debe permitir comprobar los tipos de datos utilizados para:

* `id_producto`.
* `nombre`.
* `categoria`.
* `talla`.
* `precio`.
* `cantidad_stock`.
* `estado`.
* `fecha_registro`.

Esta es una de las evidencias más importantes porque el objetivo principal del ejercicio es practicar tipos de datos.

---

## 3. Evidencia de restricciones

Ejecutar:

```sql
SHOW CREATE TABLE productos;
```

La evidencia debe permitir comprobar:

* `PRIMARY KEY`.
* `AUTO_INCREMENT`.
* `NOT NULL`.
* `UNIQUE`.
* `CHECK`.
* `ENUM`.

---

## 4. Evidencia del DML

Ejecutar:

```text
dml/inserts.sql
```

Después comprobar:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

La solución contiene 12 registros, superando el mínimo de 8.

También puede ejecutarse:

```sql
SELECT *
FROM productos;
```

para comprobar los datos insertados.

---

## 5. Evidencia de filtros

Guardar una evidencia de:

```sql
SELECT
    nombre,
    categoria,
    precio,
    cantidad_stock
FROM productos
WHERE estado = 'disponible';
```

También puede guardarse la evidencia de la consulta que filtra productos con stock bajo.

---

## 6. Evidencia de ordenamiento

Guardar el resultado de la consulta que ordena los productos por precio descendente.

Debe ser posible comprobar visualmente que los precios están ordenados correctamente.

---

## 7. Evidencia del Top 5

Guardar la evidencia de la consulta:

```text
Top 5 productos disponibles con mayor precio.
```

Debe mostrar únicamente cinco resultados.

---

## 8. Evidencia de cálculos

Guardar resultados de las consultas que utilizan:

```text
COUNT()
SUM()
AVG()
```

Estas evidencias deben demostrar:

* Cantidad de productos.
* Cantidad por categoría.
* Precio promedio.
* Unidades disponibles.
* Valor total del inventario.

---

## 9. Evidencia de agrupaciones

Guardar el resultado de las consultas que utilizan:

```text
GROUP BY
HAVING
```

Especialmente la consulta que muestra categorías con al menos dos productos.

---

## 10. Organización recomendada

Si se utilizan capturas, pueden organizarse de la siguiente manera:

```text
evidencias/
├── README.md
├── 01-ddl-tabla.png
├── 02-tipos-datos.png
├── 03-restricciones.png
├── 04-datos-insertados.png
├── 05-filtros.png
├── 06-ordenamiento.png
├── 07-top-5.png
└── 08-calculos-y-agrupaciones.png
```

Estos nombres son únicamente una recomendación de organización.

---

## 11. Validación final

Antes de entregar el ejercicio comprobar:

1. `schema.sql` se ejecuta sin errores.
2. La tabla `productos` existe.
3. Los tipos de datos son correctos.
4. Las restricciones están definidas.
5. `inserts.sql` se ejecuta correctamente.
6. Existen al menos 8 registros.
7. `consultas.sql` contiene al menos 5 consultas.
8. Las consultas producen resultados útiles.
9. Los filtros funcionan.
10. Los ordenamientos funcionan.
11. Los cálculos funcionan.
12. Las agrupaciones funcionan.
13. La carpeta se encuentra en `resoluciones/pablo-lopez/`.

Finalmente ejecutar en PowerShell:

```powershell
git status
```

y verificar que no se hayan modificado archivos base del ejercicio.
