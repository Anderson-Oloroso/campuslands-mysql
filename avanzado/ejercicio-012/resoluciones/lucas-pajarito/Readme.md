## Ejercicio 012 Avanzado

## Descripción

En este ejercicio se Hicieron uso de funciones de agrupacion tales como `SUM`, `CONCAT`
en ejemplos de consultas 

```sql

SELECT CONCAT(id_cancion, '.',titulo) AS Canciones, SUM(reproducciones) AS total_reproducciones
FROM canciones_playlist_01 
GROUP BY id_cancion, titulo ; -- Mismo ejemplo con la diferencia a que se usa CONCAT.

```

- Resultado:

![result](./evidencias/image.png)