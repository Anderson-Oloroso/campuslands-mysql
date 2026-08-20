# Solución Ejercicio 058 (Intermedio Retador) - Academia Tech (Tablas Puente M:N)

## Descripción
Esta solución modela un sistema relacional para una **Academia Tech**, implementando correctamente **tablas puente** para resolver relaciones Muchos a Muchos (M:N) con atributos propios de relación.

### Tablas Puente Diseñadas:
1. **`matriculas_bootcamp`** (Estudiantes ↔ Bootcamps): Registra la inscripción de un estudiante a uno o varios bootcamps, incluyendo atributos como `% de asistencia` y `estado de la matrícula`.
2. **`asignacion_mentores`** (Mentores ↔ Módulos): Conecta mentores con los módulos que imparten, especificando su `rol` y la `cantidad de horas asignadas`.
3. **`entregas_proyectos`** (Estudiantes ↔ Proyectos): Asocia los proyectos entregados por los alumnos con la `URL del repositorio`, `calificación` y `estado de entrega`.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` para crear la base de datos y la estructura con las restricciones de clave única (`UNIQUE`) y foránea (`FOREIGN KEY`).
2. Ejecutar `dml/inserts.sql` para poblar el sistema con datos realistas.
3. Ejecutar `dql/consultas.sql` para generar las métricas y reportes.

---

## Evidencia de Resultados

### Consulta 2: Promedio de Calificaciones por Bootcamp
| nombre_bootcamp                          | nivel       | estudiantes_con_entregas | total_proyectos_evaluados | promedio_general_bootcamp | nota_maxima | nota_minima |
|------------------------------------------|-------------|--------------------------|---------------------------|---------------------------|-------------|-------------|
| Data Analytics & SQL Mastery             | Principiante| 1                        | 1                         | 100.00                    | 100.00      | 100.00      |
| Web Development Fullstack                | Intermedio  | 2                        | 3                         | 92.83                     | 98.00       | 88.00       |
| Backend Software Engineering with Python | Avanzado    | 2                        | 3                         | 85.83                     | 94.00       | 78.50       |

### Consulta 5: Top 3 Estudiantes Destacados
| estudiante     | email                     | estado   | proyectos_entregados | promedio_global |
|----------------|---------------------------|----------|----------------------|-----------------|
| Lucía Gómez    | lucia.gomez@email.com     | Graduado | 1                    | 100.00          |
| Carlos Mendoza | carlos.mendoza@email.com  | Activo   | 2                    | 95.25           |
| Diego Fernández| diego.fernandez@email.com | Activo   | 2                    | 89.50           |