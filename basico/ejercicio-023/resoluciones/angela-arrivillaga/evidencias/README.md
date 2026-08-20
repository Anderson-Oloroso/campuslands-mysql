# Ejercicio 023 - UPDATE para arquitectura 3D

## Estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## Ejecución

1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos `arquitectura_3d_db`.
* Se implementó el uso práctico y riguroso de la sentencia de modificación de datos **UPDATE** combinada con filtros condicionales (`WHERE`), operadores aritméticos (`*`, `+`) y actualización simultánea de múltiples columnas, seguida de una consulta de control para verificar los cambios.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el presupuesto en USD sea estrictamente positivo y que la calificación del cliente permanezca dentro del rango válido de 0.00 a 5.00.
* Se estructuraron 8 registros de proyectos de arquitectura profesional modelados en plataformas BIM y CAD líderes (Revit, Archicad, Rhino 3D, SketchUp) para permitir simulaciones realistas de actualizaciones operativas y financieras.

## Salida y resultados esperados

* Actualización de estados por lote: Modificación masiva de proyectos en diseño hacia la fase de renderizado final.
* Ajuste financiero porcentual: Incremento de presupuestos condicionado al software utilizado (`SketchUp`).
* Actualización cualitativa selectiva: Normalización de calificaciones para proyectos completados y entregados.
* Modificación específica por clave única: Ajuste de contrato individual mediante el código del proyecto.
* Reporte de verificación final: Listado ordenado de los registros con formatos monetarios y estados actualizados.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM proyectos_arquitectura;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL / UPDATE:** Salida en consola de las sentencias de actualización ejecutadas y su respectiva verificación mediante consultas formateadas.