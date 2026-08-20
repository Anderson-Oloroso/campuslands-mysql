# ejercicio 028 - json en mysql para academia tech

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional de la academia tech, incluyendo tablas normalizadas y columnas con tipos de datos `json` para metadatos flexibles.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de rutas de aprendizaje, estudiantes, evaluaciones y estructuras json validas para competencias y configuraciones.
3. ejecutar el script `dql/consultas.sql` para validar el manejo nativo de datos `json` en mysql mediante operadores de extraccion (`->`, `->>`), funciones de busqueda (`json_contains`), funciones de inspeccion (`json_length`, `json_extract`) y agregaciones relacionales.

## decisiones tecnicas

* se diseño el esquema relacional `academia_tech_json_db` combinando la rigurosidad de llaves foraneas y restricciones con la flexibilidad de campos `json` para almacenar metadatos semi-estructurados (competencias técnicas y configuraciones de usuario).
* **estrategia con json en mysql:**
  - se aprovecharon las capacidades nativas de mysql para consultar propiedades anidadas sin necesidad de parseo externo en la aplicacion.
* se estructuraron 5 consultas analiticas enfocadas en reportes de rendimiento, filtrado por preferencias de entorno, busqueda de habilidades especificas dentro de arreglos json y auditoria de volumen de metadatos.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos completamente funcional y relacional que integra columnas de tipo `json` para la academia tech.
* insercion exitosa de datos con estructuras json validas y restricciones de integridad.
* consultas dql avanzadas y ejecutables que demuestran el dominio de funciones json en mysql.