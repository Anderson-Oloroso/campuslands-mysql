# Ejercicio 029 - vistas simples para marketplace de accesorios

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **marketplace de accesorios**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **vistas simples**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **vistas simples** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `vendedores_marketplace`
Almacena comerciantes y tiendas asociadas en el marketplace.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_vendedor` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del merchant |
| `nombre_tienda` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre comercial de la tienda |
| `reputacion_estrellas` | `DECIMAL(3,2) NOT NULL DEFAULT 5.00` | Calificacion promedio (1.0 - 5.0) |
| `ventas_totales` | `INT NOT NULL DEFAULT 0` | Numero de pedidos despachados |

### Tabla Secundaria: `productos_accesorios`
Almacena accesorios de tecnologia, computacion y gaming con precios y stock.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_producto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del producto |
| `nombre_producto` | `VARCHAR(80) NOT NULL` | Nombre del articulo |
| `id_vendedor` | `INT NOT NULL` | Tienda vendedora |
| `categoria` | `ENUM('Audio','Teclados y Mouses','Cables y Hubs','Soportes y Ergonomia','Iluminacion RGB','Mochilas y Fundas') NOT NULL` | Categoria |
| `precio` | `DECIMAL(7,2) NOT NULL` | Precio en USD |
| `stock` | `INT NOT NULL DEFAULT 0` | Disponibilidad en bodega |
| `es_envio_gratis` | `ENUM('Si','No') DEFAULT 'Si'` | Politica de envio |
| `valoracion_promedio` | `DECIMAL(3,2) NOT NULL DEFAULT 4.50` | Rating de clientes |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `vendedores_marketplace` y `productos_accesorios` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `vendedores_marketplace` y posteriormente en `productos_accesorios`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **vistas simples**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `vistas simples`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **vistas simples** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **marketplace de accesorios**.
