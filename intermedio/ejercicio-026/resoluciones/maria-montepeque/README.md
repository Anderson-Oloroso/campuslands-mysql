# Resolucion - Ejercicio 026 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele el catalogo de items de un videojuego RPG en
`items_intermedio`, con un `CHECK` que va mas alla de un simple rango:
cruza varias columnas para asegurar que cada tipo de item solo llene
el atributo que le corresponde (`danio` para armas, `defensa` para
armaduras, `curacion` para pociones, y ninguno de los tres para
accesorios).

## Decisiones tecnicas
- `chk_items_intermedio_stats_por_tipo` usa una cadena de `OR` con un
  bloque por tipo, cada uno exigiendo que su atributo correspondiente
  sea `NOT NULL` y los otros dos `NULL`. Esto evita, por ejemplo, un
  arma con "defensa" o una pocion con "daño".
- Los datos de `dml/inserts.sql` (3 armas, 2 armaduras, 2 pociones, 2
  accesorios) respetan el CHECK desde el inicio.
- Verifique que el CHECK realmente bloquea el caso invalido:
  ```bash
  mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 -e \
    "USE campuslands_mysql; INSERT INTO items_intermedio (nombre, tipo, nivel_requerido, precio, danio, defensa, curacion) VALUES ('Espada Rota', 'arma', 3, 50, 20, 10, NULL);"
  ```
  Resultado real obtenido:
  ```
  ERROR 3819 (HY000): Check constraint 'chk_items_intermedio_stats_por_tipo' is violated
  ```

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo del catalogo.
2. Armas ordenadas por daño.
3. Pociones ordenadas por curacion.
4. Items accesibles para un personaje de nivel 10.
5. Precio promedio por tipo de item.
6. Item mas caro de cada tipo.
