# Resolucion - Ejercicio 021 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `proyectos_basico` para un estudio de dibujo digital y
escribi seis `SELECT` centrados en `WHERE`: igualdad, desigualdad,
combinacion con `AND`, `IN`, `BETWEEN` y `OR` junto con `LIKE`.

## Decisiones tecnicas
- `tipo_arte ENUM(...)` para restringir las categorias de arte digital.
- `precio DECIMAL(10,2)` con `CHECK (precio > 0)`.
- Cada consulta usa una combinacion distinta de condiciones en el
  `WHERE` para cubrir varias formas de filtrar sin repetir el mismo
  patron.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Proyectos entregados.
2. Proyectos de un artista especifico.
3. Proyectos caros que no estan entregados (`AND`).
4. Proyectos hechos en Photoshop o Procreate (`IN`).
5. Proyectos con entrega en marzo de 2026 (`BETWEEN`).
6. Proyectos de pixel art o con "Comic" en el titulo (`OR` + `LIKE`).
