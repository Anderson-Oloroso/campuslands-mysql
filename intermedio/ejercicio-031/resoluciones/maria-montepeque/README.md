# Resolucion - Ejercicio 031 (intermedio)

## Autor
maria-montepeque

## Que hice
Modele equipos y partidas de un torneo esports MOBA. Lo particular de
`partidas_intermedio` es que tiene **dos** `FOREIGN KEY` hacia la
**misma** tabla (`id_equipo_local` e `id_equipo_visitante`, ambas
apuntando a `equipos_intermedio`). Para leer una partida con los
nombres de ambos equipos hay que unir `equipos_intermedio` dos veces,
cada vez con un alias distinto (`el` para local, `ev` para visitante).

## Decisiones tecnicas
- `CHECK (id_equipo_local <> id_equipo_visitante)`: un equipo no puede
  jugar contra si mismo.
- La consulta 3 usa `OR` entre las dos columnas unidas para encontrar
  todas las partidas de un equipo, sin importar si jugo de local o de
  visitante.
- `CHECK (marcador_local >= 0 AND marcador_visitante >= 0)` como
  restriccion minima.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado de partidas con el nombre de ambos equipos (doble JOIN).
2. Partidas de la fase final.
3. Todas las partidas de "Furia Andina" (local o visitante).
4. Cantidad de victorias como local, por equipo.
5. Partidas por fase del torneo.
6. Partidas con el marcador mas parejo.
