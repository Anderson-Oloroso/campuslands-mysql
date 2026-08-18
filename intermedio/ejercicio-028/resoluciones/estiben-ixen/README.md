# Ejercicio 028 - tablas puente para academia tech

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **academia tech**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **tablas puente**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **tablas puente** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `rutas_aprendizaje`
Almacena especialidades y rutas tecnicas de formacion (Backend, Frontend, Cloud, IA).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_ruta` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la ruta tecnica |
| `nombre_ruta` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre del Bootcamp / Especialidad |
| `duracion_meses` | `INT NOT NULL DEFAULT 6` | Meses de formacion |
| `tecnologia_principal` | `VARCHAR(50) NOT NULL` | Stack principal (Node.js, Java, Python, React) |

### Tabla Secundaria: `campers_estudiantes`
Almacena campers y estudiantes con asistencias, proyectos y estado academico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_camper` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudiante |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre del estudiante |
| `email` | `VARCHAR(60) NOT NULL UNIQUE` | Correo institucional |
| `id_ruta` | `INT NOT NULL` | Ruta en la que esta matriculado |
| `promedio_acumulado` | `DECIMAL(4,2) NOT NULL DEFAULT 0.00` | Nota media (0-100) |
| `proyectos_aprobados` | `INT NOT NULL DEFAULT 0` | Modulos aprobados |
| `estado` | `ENUM('En Proceso','Graduado','En Riesgo','Retirado') DEFAULT 'En Proceso'` | Estado de permanencia |
| `fecha_ingreso` | `DATE NOT NULL` | Inicio de clases |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `rutas_aprendizaje` y `campers_estudiantes` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `rutas_aprendizaje` y posteriormente en `campers_estudiantes`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **tablas puente**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `tablas puente`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **tablas puente** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **academia tech**.
