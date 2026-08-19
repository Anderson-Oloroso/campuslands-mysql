# Evidencias - Ejercicio 016

## Objetivo

Esta carpeta contiene las evidencias necesarias para demostrar que los scripts SQL del ejercicio fueron ejecutados correctamente.

Las evidencias deben ser claras, relacionadas con el ejercicio y suficientes para demostrar:

* Creación de la tabla.
* Inserción de datos.
* Ejecución de las consultas.
* Resultados importantes.

No es necesario guardar capturas innecesarias.

---

## 1. Evidencia del DDL

Primero ejecutar:

```text
ddl/schema.sql
```

Después seleccionar la base:

```sql
USE campuslands_mysql;
```

Comprobar las tablas:

```sql
SHOW TABLES;
```

Después comprobar la estructura:

```sql
DESCRIBE productos;
```

La evidencia debe demostrar que la tabla `productos` fue creada correctamente.

---

## 2. Evidencia de las restricciones

Para comprobar las restricciones se puede ejecutar:

```sql
SHOW CREATE TABLE productos;
```

La evidencia debe permitir identificar:

* `PRIMARY KEY`.
* `AUTO_INCREMENT`.
* `NOT NULL`.
* `UNIQUE`.
* `CHECK`.
* `ENUM`.

---

## 3. Evidencia del DML

Ejecutar:

```text
dml/inserts.sql
```

Después comprobar:

```sql
SELECT COUNT(*) AS total_productos
FROM productos;
```

La solución contiene 12 registros, por lo que debe superar el mínimo requerido de 8.

También se puede comprobar mediante:

```sql
SELECT *
FROM productos;
```

---

## 4. Evidencia de filtros

Ejecutar la consulta de productos disponibles.

La evidencia debe demostrar que solamente aparecen registros cuyo estado sea:

```text
disponible
```

También se recomienda guardar evidencia de la consulta que filtra productos cuyo precio sea menor o igual a `25.00`.

---

## 5. Evidencia del ordenamiento

Guardar una evidencia de la consulta que ordena los productos por precio descendente.

Debe ser posible comprobar visualmente que los precios están ordenados del mayor al menor.

---

## 6. Evidencia del ranking

Guardar la evidencia correspondiente al Top 5.

La consulta debe mostrar únicamente los cinco productos disponibles con mayor precio.

---

## 7. Evidencia de cálculos

Guardar resultados de las consultas que utilizan:

```text
COUNT()
AVG()
SUM()
```

Estas evidencias deben demostrar:

* Cantidad de productos.
* Cantidad de productos por categoría.
* Precio promedio.
* Valor total de productos disponibles.

---

## 8. Evidencia de agrupaciones

Guardar la evidencia de las consultas que utilizan:

```text
GROUP BY
HAVING
```

Especialmente la consulta que identifica categorías con al menos dos productos.

---

## 9. Organización recomendada

Si se guardan capturas, pueden utilizarse nombres descriptivos como:

```text
evidencias/
├── README.md
├── 01-ddl-productos.png
├── 02-restricciones.png
├── 03-datos-insertados.png
├── 04-productos-disponibles.png
├── 05-orden-precio.png
├── 06-top-5.png
├── 07-calculos.png
└── 08-agrupaciones.png
```

Los nombres anteriores son solamente una recomendación de organización.

---

## 10. Validación final

Antes de terminar el ejercicio comprobar:

1. `schema.sql` se ejecuta sin errores.
2. La tabla `productos` existe.
3. Las restricciones están presentes.
4. `inserts.sql` inserta los registros correctamente.
5. Existen al menos 8 registros.
6. `consultas.sql` contiene al menos 5 consultas.
7. Las consultas producen resultados útiles.
8. Los filtros funcionan.
9. Los ordenamientos funcionan.
10. Los cálculos funcionan.
11. Las agrupaciones funcionan.
12. La solución está dentro de `resoluciones/pablo-lopez/`.

Finalmente ejecutar:

```bash
git status
```

para verificar que no se hayan modificado archivos fuera de la resolución personal.
