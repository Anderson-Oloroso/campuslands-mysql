## Ejercicio 011 basico

## Explicación de lo trabajado

En esta parte del ejercicio se ha trabajado el uso de validaciones en MySQL, las cuales son mecanismos de seguridad y control de integridad utilizadas en las tablas

## Ejemplos

A conitnuación algunos ejemplos de validaciones

```sql
    email VARCHAR(100) UNIQUE   
 ```

- llave primaria

```sql
   id INT PRIMARY KEY   
 ```

- Llave Foranea
```sql
departamento_id INT,
FOREIGN KEY (departamento_id) REFERENCES departamentos(id)   

```