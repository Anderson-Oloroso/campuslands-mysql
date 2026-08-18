# Evidencias - Ejercicio 056

## Ejecución

- Verificar la creación de la base de datos y la tabla mediante `ddl/schema.sql`.
- Verificar la inserción de los 10 personajes mediante `dml/inserts.sql`.
- Ejecutar `dql/consultas.sql` y conservar los resultados principales.

## Evidencias importantes

- Creación correcta de `personajes_rpg`.
- Inserción de 10 registros.
- Consulta de personajes activos.
- Consulta de personajes de nivel 50 o superior.
- Conteo de personajes por clase.
- Nivel promedio por clase.
- Personaje con mayor experiencia.
- Suma de puntos de vida de personajes activos.

## Validaciones

Las restricciones `CHECK` permiten validar el rango del nivel y los puntos de vida.
Los campos `clase` y `estado` utilizan valores controlados mediante `ENUM`.