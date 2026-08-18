# Ejercicio 029 - event scheduler para marketplace de accesorios

## Descripción

En este ejercicio de nivel avanzado se profundiza en las capacidades del motor de base de datos MySQL 8 aplicado al entorno de **marketplace de accesorios**. El proyecto implementa **event scheduler**, combinando programación en base de datos, optimización, integridad y análisis analítico de alto rendimiento.

---

## Objetivos de Aprendizaje

- Dominar la sintaxis y aplicación de **event scheduler** en MySQL 8.
- Estructurar soluciones robustas bajo el modelo ACID y estándares de la industria.
- Desarrollar procedimientos, funciones, triggers, vistas, índices o expresiones avanzadas según el requerimiento.
- Analizar planes de ejecución y optimizar la recuperación de información.
- Separar de forma modular la lógica DDL, DML y DQL.

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
Define las estructuras principales (`vendedores_marketplace`, `productos_accesorios`) y los objetos programables o de rendimiento correspondientes a **event scheduler** (procedimientos, triggers, funciones, vistas o índices).

### 2. DML (`dml/inserts.sql`)
Puebla las tablas con datasets completos y variados, utilizando transacciones seguras para asegurar consistencia e idempotencia.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas avanzadas que demuestran la funcionalidad de **event scheduler**, reportes analíticos con CTEs, funciones de ventana y agregaciones complejas.

---

## Conceptos Practicados

- `event scheduler`
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

La implementación de **event scheduler** en el contexto de **marketplace de accesorios** demuestra el aprovechamiento de las características avanzadas de MySQL para resolver requerimientos de alta exigencia, rendimiento y seguridad de datos.
