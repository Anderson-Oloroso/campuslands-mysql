# Ejercicio 017 - LEFT JOIN para tienda de ropa

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **tienda de ropa**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **LEFT JOIN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **LEFT JOIN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `marcas_ropa`
Almacena marcas y proveedores de prendas textiles.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_marca` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la marca |
| `nombre_marca` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del fabricante textil |
| `pais_origen` | `VARCHAR(40) NOT NULL` | Pais de confeccion |
| `segmento` | `ENUM('Streetwear','Lujo','Deportivo','Casual','Formal') NOT NULL` | Campo segmento |

### Tabla Secundaria: `prendas_vestir`
Almacena inventario de ropa con tallas, colores, genero y stock.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_prenda` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la prenda |
| `nombre_articulo` | `VARCHAR(80) NOT NULL` | Nombre del diseno |
| `id_marca` | `INT NOT NULL` | Marca disenadora |
| `talla` | `ENUM('XS','S','M','L','XL','XXL') NOT NULL` | Talla del articulo |
| `color` | `VARCHAR(30) NOT NULL` | Color principal |
| `genero` | `ENUM('Hombre','Mujer','Unisex') NOT NULL` | Publico objetivo |
| `precio` | `DECIMAL(7,2) NOT NULL` | Precio en tienda |
| `stock_disponible` | `INT NOT NULL DEFAULT 0` | Unidades en almacen |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `marcas_ropa` y `prendas_vestir` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `marcas_ropa` y posteriormente en `prendas_vestir`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **LEFT JOIN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `LEFT JOIN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **LEFT JOIN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **tienda de ropa**.
