# Resolucion - Ejercicio 043 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el catalogo de un servicio de peliculas de miedo en
`peliculas_avanzado`, guardando en una columna `JSON` los datos
semiestructurados que no valen la pena normalizar en tablas aparte:
actores, criticas y datos de taquilla. Practique las funciones JSON
mas usadas de MySQL:

- **`->` / `->>`**: extraer un campo (anidado) del documento.
- **`JSON_CONTAINS`**: buscar si un arreglo incluye un valor especifico.
- **`JSON_TABLE`**: convertir un arreglo JSON en filas relacionales,
  tanto de valores simples (actores) como de objetos anidados
  (criticas con critico y puntuacion).
- **`JSON_LENGTH`**: contar elementos de un arreglo.
- **`JSON_ARRAY_APPEND`**: agregar un elemento a un arreglo existente
  sin reescribir todo el documento.
- **`JSON_PRETTY`**: formatear el JSON para lectura humana.

## Decisiones tecnicas
- `CHECK` sobre la estructura del JSON
  (`JSON_TYPE(...) = 'ARRAY'` / `'OBJECT'`): garantiza que toda
  pelicula tenga como minimo un arreglo de `actores` y un objeto de
  `taquilla`, aunque MySQL no valide un esquema JSON completo como lo
  haria un `JSON Schema`.
- Los `INSERT` arman el JSON con `JSON_OBJECT`/`JSON_ARRAY` en vez de
  escribir el texto del JSON a mano, para que MySQL valide la sintaxis
  al construirlo.
- "Cuarentena Cero" empieza con `"criticas": []` (arreglo vacio) a
  proposito, y `dml/inserts.sql` le agrega una critica con
  `JSON_ARRAY_APPEND` para demostrar una actualizacion parcial del
  documento. Verifique el resultado real: antes tenia 0 criticas,
  despues del `UPDATE` la consulta 6 muestra la critica de "Sangre en
  Pantalla" (puntuacion 7.2) ya presente en el arreglo.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Extraer la recaudacion de cada pelicula (`->>`).
2. Peliculas con "Elena Vidal" entre sus actores (`JSON_CONTAINS`).
3. Actores expandidos en filas (`JSON_TABLE`).
4. Cantidad de actores y criticas por pelicula (`JSON_LENGTH`).
5. Peliculas con mas de una critica registrada.
6. Confirmacion de que "Cuarentena Cero" ya tiene su critica (`JSON_ARRAY_APPEND`).
7. Criticas expandidas en filas, con sus dos campos (`JSON_TABLE` sobre objetos anidados).
