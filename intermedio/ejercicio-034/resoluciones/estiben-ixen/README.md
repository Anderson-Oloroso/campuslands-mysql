# Ejercicio 034 - HAVING para garaje de motos

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **garaje de motos**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **HAVING**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **HAVING** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `propietarios_motos`
Almacena los datos de los propietarios de motocicletas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_propietario` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del dueno |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre completo del propietario |
| `telefono` | `VARCHAR(20) NOT NULL` | Numero de contacto |
| `email` | `VARCHAR(60) NOT NULL UNIQUE` | Correo electronico |
| `estado` | `ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'` | Estado del cliente |

### Tabla Secundaria: `estacionamiento_motos`
Registra las entradas, salidas y espacios de parqueo ocupados.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estacionamiento` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del registro |
| `placa` | `VARCHAR(20) NOT NULL UNIQUE` | Numero de placa de la moto |
| `modelo` | `VARCHAR(50) NOT NULL` | Marca y linea de la moto |
| `espacio_parqueo` | `VARCHAR(15) NOT NULL UNIQUE` | Codigo de bahia o espacio |
| `id_propietario` | `INT NOT NULL` | Llave foranea a propietarios |
| `costo_hora` | `DECIMAL(6,2) NOT NULL DEFAULT 5.00` | Tarifa horaria aplicada |
| `fecha_ingreso` | `DATETIME NOT NULL` | Momento de entrada al garaje |
| `estado` | `ENUM('Activo','Completado','Cancelado') DEFAULT 'Activo'` | Estado de estancia |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `propietarios_motos` y `estacionamiento_motos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `propietarios_motos` y posteriormente en `estacionamiento_motos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **HAVING**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `HAVING`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **HAVING** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **garaje de motos**.
