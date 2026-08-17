# Resolucion - Ejercicio 042 (basico)

## Autor
maria-montepeque

## Que hice
Modele la entidad `canciones_basico` para una playlist musical,
pensando en los atributos que realmente distinguen a una cancion:
artista, genero, duracion, año de lanzamiento, reproducciones y si es
favorita.

## Decisiones tecnicas
- `genero` como `ENUM` porque es un catalogo cerrado y conocido de
  antemano, no texto libre.
- `UNIQUE (titulo, artista)` en vez de `titulo UNIQUE` a secas: dos
  artistas distintos si pueden tener canciones con el mismo titulo,
  pero el mismo artista no deberia repetir titulo.
- `favorita BOOLEAN` para practicar filtros de estado sin necesitar
  una tabla aparte.
- `CHECK (duracion_seg > 0)` y `CHECK (reproducciones >= 0)` como
  restricciones minimas de negocio.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Listado completo ordenado por genero.
2. Canciones marcadas como favoritas.
3. Top 3 canciones con mas reproducciones.
4. Duracion promedio por genero.
5. Cantidad de canciones favoritas por genero.
6. Canciones de un artista especifico.
