# Ejercicio 028 - Filtros por Estado para Academia Tech

Solución de nivel básico enfocada en la implementación de **filtros por estado** y validaciones de integridad en MySQL para la gestión de estudiantes en una academia tecnológica, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `estudiantes_academia` con campos tipados mediante `ENUM`, restricciones `UNIQUE` en correos y validaciones `CHECK` para los promedios académicos.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con datos realistas que cubren todos los estados posibles (`activo`, `pausado`, `graduado`, `retirado`).
- `dql/consultas.sql`: Implementación de 5 consultas clave enfocadas en filtros por estado, funciones de agregación (`COUNT`, `AVG`), ordenamientos y límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura y restricciones de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para verificar la correcta aplicación de los filtros por estado y reportes académicos.

## Evidencia de Resultados (Tabla de Registros Base)

| id | nombre_completo | correo | programa_estudio | promedio_general | estado | fecha_inscripcion |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Sergio Ajú | sergio.aju@campus.com | Backend | 95.50 | activo | 2026-02-15 |
| 2 | María Rodríguez | maria.rodriguez@campus.com | FullStack | 88.00 | activo | 2026-02-15 |
| 3 | Carlos Pérez | carlos.perez@campus.com | DataScience | 91.25 | graduado | 2025-06-10 |
| 4 | Ana Gómez | ana.gomez@campus.com | Frontend | 76.50 | pausado | 2026-03-01 |
| 5 | Luis Martínez | luis.martinez@campus.com | CloudDevOps | 84.00 | activo | 2026-01-20 |
| 6 | Sofía Torres | sofia.torres@campus.com | Backend | 93.75 | graduado | 2025-06-10 |
| 7 | Jorge Castillo | jorge.castillo@campus.com | Frontend | 65.00 | retirado | 2026-02-01 |
| 8 | Lucía Méndez | lucia.mendez@campus.com | FullStack | 89.90 | activo | 2026-03-12 |

## Decisiones Técnicas
- **Filtros por Estado**: Uso eficiente de operadores relacionales (`=`, `IN`) sobre columnas tipadas con `ENUM` para aislar rápidamente segmentos de estudiantes según su situación académica en la academia tech.
- **Integridad de Datos**: Uso de restricciones `CHECK` para limitar el rango lógico del `promedio_general` entre 0.00 y 100.00, asegurando la consistencia de la información.