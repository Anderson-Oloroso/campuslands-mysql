# Ejercicio 028 - Tablas Puente para Academia Tech

Solución de nivel intermedio enfocada en el diseño e implementación de **tablas puente (relaciones Muchos a Muchos)** en MySQL para una academia tecnológica, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, las entidades principales (`estudiantes_academia_intermedio`, `cursos_academia`) y la tabla puente (`inscripciones_cursos`) con restricciones de llaves foráneas en cascada, índices únicos compuestos para evitar duplicidad de inscripciones, y validaciones `CHECK`.
- `dml/inserts.sql`: Carga inicial de datos realistas (8 estudiantes, 4 cursos y múltiples registros en la tabla puente) para probar escenarios de relaciones cruzadas.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas avanzadas utilizando múltiples `JOIN`, funciones de agregación (`COUNT`, `AVG`), filtros por estado y promedios con límites.

## Ejecución
1. Ejecutar el archivo `schema.sql` para levantar la estructura relacional y restricciones de integridad.
2. Ejecutar el archivo `inserts.sql` para poblar las tablas con los registros iniciales.
3. Ejecutar el archivo `consultas.sql` para verificar la ejecución de los reportes basados en la tabla puente.

## Decisiones Técnicas
- **Modelado Muchos a Muchos**: Se empleó una tabla intermedia `inscripciones_cursos` para relacionar alumnos con múltiples cursos de la academia tech, almacenando atributos propios de la relación como `calificacion_final` y `estado_inscripcion`.
- **Integridad Referencial**: Uso de restricciones `UNIQUE (estudiante_id, curso_id)` para garantizar que un estudiante no pueda inscribirse dos veces al mismo curso de forma simultánea.