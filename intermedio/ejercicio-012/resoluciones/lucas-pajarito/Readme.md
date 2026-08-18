## Ejercicio 012 nivel avanzado 

## Descripción
En este ejercicio se ha trabajacon normalizacion de datos y consultas basicas y avanzadas, proporcionando asi una mejor gestión de uso de los conocimientos adquiridos.


Ejemplo

```sql
SELECT concat(titulo, '-', duracion_segundos,'s') as cancion
FROM cancion INNER JOIN artista ON cancion.id_artista = artista.id_artista
WHERE genero = 'Pop' AND duracion_segundos > 200;

```