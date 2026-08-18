# Ejercicio 017 - procedimientos almacenados para tienda de ropa

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **tienda de ropa**. El proyecto implementa **procedimientos almacenados**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **procedimientos almacenados** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

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
Define las estructuras principales (`marcas_ropa`, `prendas_vestir`) y los objetos programables o de rendimiento correspondientes a **procedimientos almacenados** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **procedimientos almacenados**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `procedimientos almacenados`
- Integridad transaccional ACID
- `INNER JOIN`, `LEFT JOIN`
- Common Table Expressions (`WITH`)
- Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)
- Optimización y planes de ejecución

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` (creación de estructuras y objetos programables).
2. Ejecutar `dml/inserts.sql` (poblado de información controlada).
3. Ejecutar `dql/consultas.sql` (ejecución de consultas de alto nivel y validación).

---

## Conclusión

La implementación de **procedimientos almacenados** en el contexto de **tienda de ropa** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
