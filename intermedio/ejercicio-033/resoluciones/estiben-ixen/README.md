# Ejercicio 033 - GROUP BY para inventario de skins shooter

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **inventario de skins shooter**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **GROUP BY**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **GROUP BY** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `armas_shooter`
Almacena el catalogo base de armas del juego shooter.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_arma` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del arma base |
| `nombre` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del modelo de arma |
| `tipo` | `VARCHAR(40) NOT NULL` | Tipo de armamento (Rifle, Pistola, etc.) |
| `categoria` | `ENUM('Principal','Secundaria','Cuerpo a Cuerpo') NOT NULL` | Slot de equipamiento |
| `estado` | `ENUM('Disponible','Bloqueado') DEFAULT 'Disponible'` | Disponibilidad |

### Tabla Secundaria: `skins_inventario`
Almacena los camuflajes y skins en el inventario con sus rarezas y precios.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_skin` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico de la skin |
| `nombre_skin` | `VARCHAR(60) NOT NULL` | Nombre del diseno/skin |
| `id_arma` | `INT NOT NULL` | Llave foranea al arma |
| `rareza` | `ENUM('Consumer','Restricted','Classified','Covert','Contraband') NOT NULL` | Grado de rareza |
| `precio` | `DECIMAL(10,2) NOT NULL DEFAULT 0` | Valor estimado de mercado |
| `desgaste` | `ENUM('Recien Fabricado','Casi Nuevo','Algo Desgastado','Bastante Desgastado') NOT NULL` | Condicion visual |
| `fecha_adquisicion` | `DATE NOT NULL` | Fecha en que se obtuvo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `armas_shooter` y `skins_inventario` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `armas_shooter` y posteriormente en `skins_inventario`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **GROUP BY**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `GROUP BY`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **GROUP BY** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **inventario de skins shooter**.
