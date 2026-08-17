# Resolución Ejercicio 009 (Básico) - DELETE Controlado en Kickboxing

**Estudiante:** Allison Vargas  
**Nivel:** Básico Inicial  

## Conceptos Aplicados
* **DELETE Controlado**: Eliminación segura de registros que cumplen condiciones estrictas (estado_inscripcion = 'cancelada' AND asistencias = 0) para evitar pérdida indebida de historial o datos de auditoría.
* **Integridad y Verificación**: Inclusión de restricciones de chequeo (CHECK) y consultas de comprobación post-eliminación.

## Estructura de Ejecución
1. ddl/schema.sql: Definición de la tabla inscripciones_kickboxing.
2. dml/inserts.sql: Inserción de 8 registros iniciales y aplicación del DELETE filtrado.
3. dql/consultas.sql: 5 consultas de reporte y validación.
