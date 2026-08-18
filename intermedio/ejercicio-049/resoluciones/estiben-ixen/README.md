# Ejercicio 049 - HAVING para paracaidismo

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **paracaidismo**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **HAVING**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **HAVING** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `zonas_salto`
Almacena zonas de despegue y aterrizaje de paracaidismo (Drop Zones).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_zona` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la pista |
| `nombre_zona` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del centro de paracaidismo |
| `altitud_pista_metros` | `INT NOT NULL` | Elevacion sobre nivel del mar |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de operacion |

### Tabla Secundaria: `saltos_registrados`
Registra saltos libres, altura, tiempo de caida y certificaciones.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_salto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del salto |
| `paracaidista` | `VARCHAR(70) NOT NULL` | Nombre del saltador |
| `tipo_salto` | `ENUM('Tandem','Solo AFF','Wingsuit','Formacion BFR','HALO') NOT NULL` | Modalidad de salto |
| `id_zona` | `INT NOT NULL` | Zona de ejecucion |
| `altitud_salto_pies` | `INT NOT NULL` | Altura de salida en pies |
| `tiempo_caida_libre_seg` | `INT NOT NULL` | Segundos en gravedad pura |
| `costo_salto` | `DECIMAL(7,2) NOT NULL` | Costo de la experiencia |
| `fecha_salto` | `DATETIME NOT NULL` | Fecha y hora del vuelo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `zonas_salto` y `saltos_registrados` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `zonas_salto` y posteriormente en `saltos_registrados`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **HAVING** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **paracaidismo**.
