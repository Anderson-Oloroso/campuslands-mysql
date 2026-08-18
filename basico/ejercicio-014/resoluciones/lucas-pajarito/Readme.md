## Ejericio 014

## Descripción
En este ejericio se han utilizado la insercion de datos como tipo fecha `DATE` a continuacion ejemplo de como se creo la tabla y se genero la consulta

```sql
CREATE TABLE basico_ejercicio_014 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  puntaje INT NOT NULL DEFAULT 0,
  creado_en DATE NOT NULL -- tipo DATE.
);


```


```sql
SELECT nombre, creado_en 
FROM basico_ejercicio_014
WHERE creado_en >= '1500-12-30'
ORDER BY nombre, creado_en;
```





