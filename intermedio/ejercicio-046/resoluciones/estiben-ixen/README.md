# Ejercicio 046 - INNER JOIN para restaurante de comida urbana

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **restaurante de comida urbana**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **INNER JOIN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **INNER JOIN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `categorias_menu`
Almacena secciones del menu de comida urbana.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_categoria` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de seccion |
| `nombre_categoria` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre de la categoria del menu |
| `descripcion` | `VARCHAR(100) NOT NULL` | Detalle de la linea gastronomica |

### Tabla Secundaria: `platillos_urbanos`
Almacena hamburguesas, tacos, bowls y platillos con calorias y costos.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_platillo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del plato |
| `nombre_platillo` | `VARCHAR(80) NOT NULL` | Nombre comercial |
| `id_categoria` | `INT NOT NULL` | Categoria en la carta |
| `precio` | `DECIMAL(6,2) NOT NULL` | Precio en USD |
| `tiempo_preparacion_min` | `INT NOT NULL DEFAULT 15` | Minutos de cocina |
| `calorias` | `INT NOT NULL` | Aporte energetico kcal |
| `es_vegetariano` | `ENUM('Si','No') DEFAULT 'No'` | Opcion apta para vegetarianos |
| `disponible` | `ENUM('Si','No') DEFAULT 'Si'` | Campo disponible |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `categorias_menu` y `platillos_urbanos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `categorias_menu` y posteriormente en `platillos_urbanos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **INNER JOIN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `INNER JOIN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **INNER JOIN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **restaurante de comida urbana**.
