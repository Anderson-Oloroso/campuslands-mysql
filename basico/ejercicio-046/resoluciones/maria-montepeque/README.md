# Resolucion - Ejercicio 046 (basico)

## Autor
maria-montepeque

## Que hice
Cree la tabla `platos_basico` para el menu de un restaurante de comida
urbana, con los datos tipicos de una carta: categoria, precio,
calorias y disponibilidad.

## Decisiones tecnicas
- `categoria ENUM(...)` como catalogo cerrado de las secciones
  habituales de un menu.
- `CHECK (precio > 0)` y `CHECK (calorias > 0)` como restricciones
  minimas de negocio.
- La consulta 3 calcula las calorias por cada mil pesos de precio
  (`calorias / (precio / 1000)`), sin necesitar una columna adicional
  para ese dato derivado.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Menu completo ordenado por precio.
2. Platos de la categoria plato fuerte.
3. Calorias por cada mil pesos de precio.
4. Cantidad de platos por categoria.
5. Top 3 platos mas caros.
6. Platos creados antes de 2020.
