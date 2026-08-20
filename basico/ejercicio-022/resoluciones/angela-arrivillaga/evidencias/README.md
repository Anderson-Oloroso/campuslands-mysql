# Ejercicio 022 - ORDER BY para animación 3D

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

* Se utilizó la base de datos `animacion_3d_db`.
* Se implementó el uso integral y avanzado de la cláusula **ORDER BY** (tanto en orden ascendente `ASC` como descendente `DESC`), ordenamientos multinivel por múltiples columnas y combinación con restricciones y límites (`LIMIT`).
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el tiempo de render en horas sea estrictamente positivo y que la calificación técnica se mantenga en el rango de 0.00 a 5.00.
* Se estructuraron 8 registros de proyectos de animación 3D profesionales desarrollados en softwares líderes de la industria (Blender, Maya, Houdini, ZBrush) para permitir pruebas exhaustivas de ordenamiento analítico.

## Salida y resultados esperados

* Ordenamiento por calificación técnica: Listado de proyectos ordenados de manera descendente para identificar los de mayor calidad visual.
* Ordenamiento por tiempo de render: Clasificación de los proyectos por costo computacional (horas de render) de menor a mayor.
* Ordenamiento multinivel: Agrupación visual mediante ordenamiento combinado por software 3D alfabético y subordenamiento por calificación técnica.
* Filtrado combinado con ordenamiento: Extracción de proyectos finalizados ordenados por su tiempo de renderizado descendente.
* Ranking Top 5: Consulta optimizada con `ORDER BY` y `LIMIT` para aislar los 5 mejores proyectos de la academia.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM proyectos_animacion;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el dominio profesional de la cláusula `ORDER BY` en MySQL.