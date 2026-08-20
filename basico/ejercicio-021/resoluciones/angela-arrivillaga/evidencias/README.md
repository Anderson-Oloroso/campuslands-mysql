# Ejercicio 021 - WHERE para dibujo digital

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

* Se utilizó la base de datos `dibujo_digital_db`.
* Se implementó el uso completo de la cláusula **WHERE** combinando diversos operadores de filtrado condicional (`=`, `>`, `IN`, `AND`, `LIKE`) orientados a la gestión de metadatos de ilustraciones y proyectos de dibujo digital.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el tiempo dedicado en horas sea mayor a cero y que la calificación del artista se mantenga en el rango de 0.00 a 5.00.
* Se estructuraron 8 registros artísticos diversos que incluyen software populares de la industria (Clip Studio Paint, Procreate, Photoshop, Krita) y múltiples estados operativos (publicado, en proceso, borrador, archivado).

## Salida y resultados esperados

* Filtrado por estado operativo: Listado exclusivo de las obras que se encuentran publicadas en la galería.
* Filtrado por umbral de tiempo: Extracción de proyectos que demandaron más de 10 horas de esfuerzo creativo.
* Filtrado por software específico (`IN`): Consulta multicriterio que aisla obras desarrolladas en herramientas seleccionadas.
* Filtrado combinado lógico (`AND`): Obras destacadas con alta calificación que cumplen simultáneamente con estar publicadas.
* Filtrado por coincidencia de patrón (`LIKE`): Búsqueda de proyectos cuyos títulos contienen términos clave como "Estudio".

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM obras_dibujo;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el uso profesional de la cláusula `WHERE` en MySQL.