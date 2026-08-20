# Ejercicio 014 - vistas simples para saga de ciencia ficcion

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **saga de ciencia ficcion**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **vistas simples**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **vistas simples** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `facciones_scifi`
Almacena imperios, corporaciones y facciones galacticas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_faccion` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la faccion |
| `nombre_faccion` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre de la organizacion interestelar |
| `planeta_capital` | `VARCHAR(50) NOT NULL` | Sede del gobierno |
| `tipo_gobierno` | `ENUM('Imperio','Federacion','Corporacion','Gremio') NOT NULL` | Sistema politico |

### Tabla Secundaria: `naves_espaciales`
Almacena naves espaciales con blindaje, propulsion y capacidad de tripulacion.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_nave` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la nave |
| `nombre_nave` | `VARCHAR(70) NOT NULL` | Nombre de la embarcacion cosmica |
| `clase` | `ENUM('Caza Ligero','Corbeta','Fragata','Destructor','Crucero de Batalla','Nave Insignia') NOT NULL` | Clase de navio |
| `id_faccion` | `INT NOT NULL` | Faccion a la que pertenece |
| `tripulacion_max` | `INT NOT NULL` | Capacidad de personal a bordo |
| `velocidad_curvatura` | `DECIMAL(4,2) NOT NULL` | Factor Warp / Curvatura |
| `nivel_escudos` | `INT NOT NULL DEFAULT 100` | Porcentaje de integridad de escudo |
| `estado_operativo` | `ENUM('Activo','En Mantenimiento','Destruida') DEFAULT 'Activo'` | Campo estado_operativo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `facciones_scifi` y `naves_espaciales` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `facciones_scifi` y posteriormente en `naves_espaciales`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **vistas simples** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **saga de ciencia ficcion**.
