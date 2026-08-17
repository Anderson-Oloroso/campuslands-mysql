# Resolucion - Ejercicio 016 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `platillos_urbanos_basico` para el menu de un restaurante de comida
urbana, con categorias (hamburguesa, taco, bebida, postre, acompanamiento) y un
estado de disponibilidad (`disponible`, `agotado`, `descontinuado`).

## Decisiones tecnicas
- `precio DECIMAL(10,2)` para evitar errores de redondeo con dinero.
- `CHECK (precio > 0)` como restriccion minima pedida por el ejercicio.
- `nombre UNIQUE` para no duplicar platillos en el menu.
- `estado ENUM` para practicar filtros por disponibilidad.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo por categoria y precio.
2. Platillos disponibles ordenados por precio.
3. Total y promedio de precio por categoria.
4. Top 3 platillos mas caros.
5. Platillos no vendibles (agotados o descontinuados).
6. Ranking de categorias por platillos disponibles.
