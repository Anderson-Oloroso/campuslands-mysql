# Resolucion - Ejercicio 045 (basico)

## Autor
maria-montepeque

## Que hice
Modele una relacion simple 1 a N para una biblioteca gamer:
`usuarios_basico` y `juegos_basico`, donde cada juego pertenece a un
solo usuario y un usuario puede tener muchos juegos.

## Decisiones tecnicas
- `id_usuario` en `juegos_basico` es la unica forma en que se expresa
  la relacion: no se repite el nombre del usuario en cada juego, se
  consulta con `JOIN`.
- `CHECK (amigos >= 0)`, `CHECK (horas_jugadas >= 0)` y
  `CHECK (precio > 0)` como restricciones minimas.
- `nombre_usuario UNIQUE` para no duplicar usuarios.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Juegos con el nombre del usuario.
2. Juegos de un usuario especifico.
3. Cantidad de juegos por usuario.
4. Juego con mas horas jugadas por usuario.
5. Usuarios con mas de 50 amigos.
6. Horas totales jugadas por usuario.
