# Resolucion - Ejercicio 046 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele platos y combos de un restaurante de comida urbana. Lo
particular de `combos_intermedio` es que tiene **dos** `FOREIGN KEY`
hacia la **misma** tabla (`id_plato_principal` e
`id_plato_acompanamiento`, ambas apuntando a `platos_intermedio`). Para
leer un combo con los nombres de ambos platos hay que unir
`platos_intermedio` dos veces, cada vez con un alias distinto (`pp`
para principal, `pa` para acompañamiento).

## Decisiones tecnicas
- `CHECK (id_plato_principal <> id_plato_acompanamiento)`: un combo no
  puede emparejar un plato consigo mismo.
- La consulta 3 usa `OR` entre las dos columnas unidas para encontrar
  todos los combos que incluyen un plato especifico, sin importar si
  aparece como principal o como acompañamiento.
- `CHECK (precio_combo > 0)` como restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado de combos con el nombre de ambos platos (doble JOIN).
2. Combos disponibles actualmente.
3. Todos los combos que incluyen "Hamburguesa Clasica" (principal o acompañamiento).
4. Cantidad de combos en los que cada plato aparece como principal.
5. Cantidad de combos por disponibilidad.
6. Combos con mayor ahorro frente a comprar los platos por separado.
