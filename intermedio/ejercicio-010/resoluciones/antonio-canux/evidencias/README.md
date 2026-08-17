# Ejercicio Intermedio 010 - Restricción UNIQUE

**Camper:** Antonio Canux

## Descripción

Décimo y último ejercicio de nivel intermedio, enfocado en un módulo de datos de carreras urbanas. El objetivo fundamental de esta práctica es implementar y comprender la restricción **`UNIQUE`** en MySQL. A diferencia de una llave primaria (`PRIMARY KEY`), una tabla puede tener múltiples columnas `UNIQUE`, asegurando que no se registren valores duplicados en datos sensibles como los 'apodos' de la calle o las 'placas' de los vehículos, manteniendo la integridad de la base de datos a nivel de negocio.

---

## Tablas utilizadas

**intermedio_ejercicio_010_corredores**
- id (PK)
- apodo (UNIQUE)
- nombre_real
- creado_en

**intermedio_ejercicio_010_vehiculos**
- id (PK)
- corredor_id (FK)
- placa (UNIQUE)
- modelo
- notas_mecanicas

---

## Consultas realizadas

### 1. ¿Cómo verificar estructuralmente que los índices `UNIQUE` fueron creados correctamente?

```sql
SHOW INDEX 
    FROM intermedio_ejercicio_010_vehiculos 
    WHERE Non_unique = 0;
```

**Resultado**

![Consulta 1](consulta_01.png)

---

### 2. ¿Cómo realizar una búsqueda garantizando un solo resultado utilizando el apodo (UNIQUE)?

```sql
SELECT nombre_real, apodo 
    FROM intermedio_ejercicio_010_corredores 
    WHERE apodo = 'Ghost';
```

**Resultado**

![Consulta 2](consulta_02.png)

---

### 3. ¿Cuál es el estado mecánico de un vehículo específico consultado mediante su placa única?

```sql
SELECT modelo, placa, notas_mecanicas 
    FROM intermedio_ejercicio_010_vehiculos 
    WHERE placa = 'STI-WRX-55';
```

**Resultado**

![Consulta 3](consulta_03.png)

---

### 4. ¿Cuál es el listado de corredores y sus vehículos, cruzando la información?

```sql
SELECT c.apodo, v.modelo, v.placa 
    FROM intermedio_ejercicio_010_corredores c 
    JOIN intermedio_ejercicio_010_vehiculos v ON c.id = v.corredor_id 
    ORDER BY c.apodo ASC;
```

**Resultado**

![Consulta 4](consulta_04.png)

---

### 5. ¿Cómo validar estadísticamente que no existen registros duplicados en las columnas `UNIQUE`?

```sql
SELECT COUNT(id) AS total_vehiculos, COUNT(DISTINCT placa) AS placas_unicas 
    FROM intermedio_ejercicio_010_vehiculos;
```

*(Nota técnica: Si intentáramos ejecutar `INSERT INTO intermedio_ejercicio_010_corredores (apodo, nombre_real) VALUES ('Ghost', 'Otro Nombre');`, MySQL arrojaría el Error 1062: Duplicate entry 'Ghost' for key 'apodo').*

**Resultado**

![Consulta 5](consulta_05.png)

---

## Herramientas

- MySQL
- MySQL Workbench
- Git
- GitHub

---

**Campuslands · Skill SQL**