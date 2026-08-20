# Ejercicio 053 - normalizacion 3FN para arquitectura 3D

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **arquitectura 3D**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 3FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 3FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `firmas_arquitectura`
Almacena despachos y firmas internacionales de arquitectura.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_firma` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la firma |
| `nombre_firma` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del estudio arquitectonico |
| `pais` | `VARCHAR(40) NOT NULL` | Sede central |
| `arquitecto_lider` | `VARCHAR(70) NOT NULL` | Director de diseno |

### Tabla Secundaria: `proyectos_bim`
Almacena proyectos arquitectonicos, metros cuadrados, presupuestos y modelos BIM.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_proyecto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del proyecto arquitectonico |
| `nombre_obra` | `VARCHAR(90) NOT NULL` | Nombre del edificio o residencia |
| `id_firma` | `INT NOT NULL` | Firma proyectista |
| `tipologia` | `ENUM('Residencial Lujo','Rascacielos Corporativo','Museo/Cultural','Hospitalario','Comercial') NOT NULL` | Tipo de inmueble |
| `area_m2` | `DECIMAL(10,2) NOT NULL` | Area construida en metros cuadrados |
| `presupuesto_millones` | `DECIMAL(8,2) NOT NULL` | Costo estimado de ejecucion en USD |
| `software_bim` | `ENUM('Revit BIM','Archicad','Rhino Grasshopper','SketchUp Pro') NOT NULL` | Plataforma de modelado |
| `estado_proyecto` | `ENUM('En Diseno','Aprobado','En Construccion','Finalizado') DEFAULT 'En Diseno'` | Campo estado_proyecto |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `firmas_arquitectura` y `proyectos_bim` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `firmas_arquitectura` y posteriormente en `proyectos_bim`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 3FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 3FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 3FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **arquitectura 3D**.
