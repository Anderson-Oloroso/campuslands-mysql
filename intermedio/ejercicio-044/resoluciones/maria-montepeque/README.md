# Resolucion - Ejercicio 044 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele la flota de naves de una saga de ciencia ficcion en
`naves_saga_intermedio` y cree tres vistas **simples**: una sola
tabla, sin `JOIN` ni agregacion.

1. **`vw_naves_disponibles_intermedio`**: solo naves con
   `unidades_disponibles > 0`.
2. **`vw_naves_destacadas_intermedio`**: solo naves marcadas como
   destacadas de la flota.
3. **`vw_catalogo_flota_publico_intermedio`**: una proyeccion que
   oculta las `unidades_disponibles` internas; un aliado externo no
   deberia ver el inventario exacto, solo el nombre, la clase y el
   precio.

## Decisiones tecnicas
- Las tres vistas son actualizables (una sola tabla base, sin
  agregacion), aunque este ejercicio se centra en usarlas para
  consultar, no para escribir a traves de ellas.
- La consulta 4 combina dos vistas con `JOIN` para responder "que
  naves destacadas tienen unidades disponibles", mostrando que las
  vistas se pueden combinar entre si como cualquier tabla.
- Verifique que la vista publica realmente no expone el inventario:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
    "USE campuslands_mysql; SELECT unidades_disponibles FROM vw_catalogo_flota_publico_intermedio;"
  ```
  Resultado real obtenido:
  ```
  ERROR 1054 (42S22): Unknown column 'unidades_disponibles' in 'field list'
  ```
- `CHECK (precio > 0)` y `CHECK (unidades_disponibles >= 0)` como
  restricciones minimas.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Naves disponibles para desplegar.
2. Naves destacadas de la flota.
3. Catalogo publico completo.
4. Naves destacadas que ademas tienen unidades disponibles.
5. Precio promedio del catalogo publico, por clase.
6. Confirmacion de que la vista publica no expone las unidades disponibles.
