# Resolucion - Ejercicio 041 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele el catalogo de equipamiento de un club de pingpong en
`equipamiento_pingpong_intermedio`, con un `CHECK` que va mas alla de
un simple rango: cruza varias columnas para asegurar que cada tipo de
equipo solo llene el atributo que le corresponde (`velocidad` para
raquetas, `rebote` para pelotas, `dimension_cm` para mesas, y ninguno
de los tres para accesorios).

## Decisiones tecnicas
- `chk_equipamiento_intermedio_stats_por_tipo` usa una cadena de `OR`
  con un bloque por tipo, cada uno exigiendo que su atributo
  correspondiente sea `NOT NULL` y los otros dos `NULL`. Esto evita,
  por ejemplo, una raqueta con "rebote" o una pelota con "velocidad".
- Los datos de `dml/inserts.sql` (3 raquetas, 2 pelotas, 2 mesas, 2
  accesorios) respetan el CHECK desde el inicio.
- Verifique que el CHECK realmente bloquea el caso invalido:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
    "USE campuslands_mysql; INSERT INTO equipamiento_pingpong_intermedio (nombre, tipo, precio, velocidad, rebote, dimension_cm) VALUES ('Raqueta Rota', 'raqueta', 50000, 80, 70, NULL);"
  ```
  Resultado real obtenido:
  ```
  ERROR 3819 (HY000): Check constraint 'chk_equipamiento_intermedio_stats_por_tipo' is violated.
  ```

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo del catalogo.
2. Raquetas ordenadas por velocidad.
3. Pelotas ordenadas por rebote.
4. Equipamiento economico (precio de 50000 o menos).
5. Precio promedio por tipo de equipamiento.
6. Item mas caro de cada tipo.
