# Ejercicio 035 - subconsultas para taller mecanico de motos

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **taller mecanico de motos**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **subconsultas**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **subconsultas** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `mecanicos`
Almacena el personal tecnico calificado del taller mecanico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_mecanico` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del mecanico |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del especialista |
| `especialidad` | `VARCHAR(50) NOT NULL` | Area tecnica (Motores, Electrico, Frenos) |
| `rango` | `ENUM('Junior','Intermedio','Senior') NOT NULL` | Nivel de experiencia |
| `estado` | `ENUM('Disponible','Ocupado','Vacaciones') DEFAULT 'Disponible'` | Disponibilidad laboral |

### Tabla Secundaria: `servicios_taller`
Registra las ordenes de reparacion, mantenimiento y diagnostico de motocicletas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_servicio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la orden de servicio |
| `moto` | `VARCHAR(50) NOT NULL` | Marca y modelo de la motocicleta |
| `placa` | `VARCHAR(20) NOT NULL` | Placa de circulacion |
| `id_mecanico` | `INT NOT NULL` | Mecanico asignado al trabajo |
| `descripcion` | `VARCHAR(150) NOT NULL` | Trabajo o mantenimiento a ejecutar |
| `costo` | `DECIMAL(8,2) NOT NULL DEFAULT 0` | Costo total del servicio |
| `estado` | `ENUM('Pendiente','En Proceso','Finalizado','Cancelado') DEFAULT 'Pendiente'` | Progreso del trabajo |
| `fecha_servicio` | `DATE NOT NULL` | Fecha de realizacion o ingreso |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `mecanicos` y `servicios_taller` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `mecanicos` y posteriormente en `servicios_taller`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **subconsultas**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `subconsultas`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **subconsultas** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **taller mecanico de motos**.
