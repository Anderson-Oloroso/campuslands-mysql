# Ejercicio 028 - JSON en MySQL para Academia Tech

Solución de nivel avanzado enfocada en la implementación, almacenamiento y consulta de **datos semiestructurados en formato JSON** dentro de MySQL para una academia tecnológica, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos y la tabla `estudiantes_academia_avanzado`, incorporando una columna de tipo `JSON` para metadatos flexibles (habilidades, puntajes y certificaciones) protegida con una restricción `CHECK (JSON_VALID(...))`.
- `dml/inserts.sql`: Carga inicial de 8 registros normalizados con estructuras JSON realistas y diversos casos de prueba.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas utilizando operadores de extracción JSON (`->>`), funciones de validación y búsqueda (`JSON_CONTAINS`, `JSON_LENGTH`), conversiones de tipos y funciones de agregación (`AVG`, `COUNT`).

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la estructura y restricciones de la base de datos.
2. Ejecutar el archivo `inserts.sql` para poblar los registros iniciales con metadatos JSON.
3. Ejecutar el archivo `consultas.sql` para verificar la ejecución de las consultas analíticas sobre estructuras JSON.

## Decisiones Técnicas
- **Uso de Tipos JSON**: Se implementó una columna JSON para gestionar atributos dinámicos y semiestructurados (como listas de habilidades y certificaciones variables por estudiante) sin romper el esquema relacional principal.
- **Validación Estricta**: Uso de restricciones `CHECK` combinadas con `JSON_VALID()` para garantizar la integridad de los datos estructurados insertados en formato JSON.