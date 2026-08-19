# Ejercicio 040 - Restricciones UNIQUE para Carreras Urbanas

## Estructura del Proyecto

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

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos y configurar las restricciones de unicidad (`UNIQUE`).
2. Ejecutar el script `dml/inserts.sql` para poblar con datos realistas e íntegros.
3. Ejecutar el script `dql/consultas.sql` para comprobar los reportes analíticos y la efectividad de las reglas de negocio.

## Decisiones Técnicas

* Se diseñó la base de datos `carreras_urbanas_unique_db` aplicando restricciones **`UNIQUE`** de forma profesional para prevenir duplicados críticos a nivel de negocio:
  - **`atletas`**: Los campos `correo_electronico` y `documento_identidad` tienen restricciones `UNIQUE` individuales para asegurar que cada corredor sea único e irrepetible.
  - **`carreras`**: Restricción compuesta `UNIQUE (nombre_carrera, edicion)` para evitar duplicar la misma edición de un evento.
  - **`inscripciones`**: Restricción compuesta `UNIQUE (id_carrera, id_atleta)` para impedir que un atleta se inscriba dos veces en la misma carrera, y `UNIQUE (id_carrera, numero_dorsal)` para garantizar que no existan dorsales repetidos dentro de un mismo evento deportivo.
  - **`resultados`**: Restricción `UNIQUE` en `id_inscripcion` para asegurar que cada participación tenga un único registro oficial de tiempo.
* Se implementaron claves foráneas robustas y restricciones `CHECK` para validar distancias, edades y dorsales positivos.

## Salida y Resultados Esperados

* Estructura de base de datos altamente confiable que rechaza de forma automática duplicados de identidad, correos, dorsales e inscripciones dobles.
* Inserción de 4 carreras urbanas, 10 atletas con datos únicos, 4 categorías, múltiples inscripciones y resultados oficiales.
* Consultas DQL avanzadas con uniones (`JOIN`), funciones de agregación condicional (`CASE WHEN`), agrupación y reportes de podios y estadísticas por categoría.