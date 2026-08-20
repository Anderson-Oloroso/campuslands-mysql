# Ejercicio 032 - Tipos de datos para ranking Battle Royale

## Descripción

Solución del ejercicio de MySQL enfocado en el uso correcto de tipos de datos para almacenar información de jugadores de un ranking Battle Royale.

## Estructura

```text
carlos-velasco/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md
```

## Ejecución

Ejecutar los archivos en este orden:

```text
1. ddl/schema.sql
2. dml/inserts.sql
3. dql/consultas.sql
```

Desde MySQL:

```sql
SOURCE ddl/schema.sql;
SOURCE dml/inserts.sql;
SOURCE dql/consultas.sql;
```

## Decisiones técnicas

* `INT UNSIGNED` para identificadores, niveles y cantidades.
* `VARCHAR` para datos de texto.
* `DECIMAL(8,2)` para los puntos de ranking.
* `DATE` para la fecha de registro.
* `BOOLEAN` para el estado activo del jugador.
* `UNIQUE` para evitar nombres de usuario duplicados.
* `CHECK` para impedir que las victorias superen las partidas jugadas.

Se utilizaron 10 registros para permitir validar filtros, ordenamientos y cálculos.


## Validación rápida

```bash
cd basico/ejercicio-032/resoluciones/carlos-velasco

mysql -u root -p < ddl/schema.sql
mysql -u root -p < dml/inserts.sql
mysql -u root -p < dql/consultas.sql
```

La solución queda alineada con **CREATE TABLE + tipos de datos**, mantiene la separación **DDL → DML → DQL** y no introduce tablas o relaciones innecesarias para este ejercicio.

# Resultados esperados

### Consulta 1 — Jugadores activos

```text
+----------------+-------------+--------------+-------+----------------+
| nombre_usuario | pais        | nivel        |       | puntos_ranking |
+----------------+-------------+--------------+-------+----------------+
| BlazeKing      | Peru        | 48           |       |        2250.90 |
| NightWolf      | Colombia    | 45           |       |        2100.00 |
| ShadowHunter   | Guatemala   | 42           |       |        1850.50 |
| ThunderAce     | El Salvador | 40           |       |        1785.35 |
| StormRider     | Mexico      | 38           |       |        1725.75 |
| IceFalcon      | Chile       | 36           |       |        1650.80 |
| CrimsonBlade   | Honduras    | 33           |       |        1545.15 |
| FireGhost      | Argentina   | 31           |       |        1480.25 |
| DarkVenom      | Guatemala   | 29           |       |        1325.40 |
+----------------+-------------+--------------+-------+----------------+
```

`SilverFox` no aparece porque está registrado como jugador inactivo.

### Consulta 2 — Más de 1500 puntos

```text
NightWolf      | 2100.00
BlazeKing      | 2250.90
ShadowHunter   | 1850.50
ThunderAce     | 1785.35
StormRider     | 1725.75
IceFalcon      | 1650.80
CrimsonBlade   | 1545.15
```

### Consulta 3 — Jugadores de Guatemala

```text
ShadowHunter | Guatemala | 42 | 1850.50 | 86
DarkVenom    | Guatemala | 29 | 1325.40 | 39
```

### Consulta 4 — Top 5 por victorias

```text
BlazeKing     | 142
NightWolf     | 125
ShadowHunter  | 86
ThunderAce    | 79
StormRider    | 72
```

### Consulta 5 — Promedio de ranking

```text
1665.87
```

### Consulta 6 — Porcentaje de victorias

```text
BlazeKing      | 31.56%
NightWolf      | 30.49%
StormRider     | 25.71%
ThunderAce     | 26.33%
ShadowHunter   | 26.88%
...
```

