# Ejercicio Avanzado 010 - Backup Lógico

**Camper:** Antonio Canux

## Descripción

Décimo y último ejercicio de nivel avanzado, aplicado a un módulo de datos de carreras urbanas. El objetivo es documentar y practicar las estrategias de **Backup Lógico**. Un backup lógico implica exportar las sentencias SQL o datos estructurados necesarios para recrear la base de datos o sus registros. En esta práctica, se simula una clonación interna de tabla (`INSERT INTO ... SELECT`) como mecanismo de respaldo interno y recuperación ante desastres, además de documentar el uso de la herramienta externa de terminal `mysqldump`.

---

## Tablas utilizadas

**avanzado_ejercicio_010_autos** (Tabla de Producción)
- id (PK)
- piloto
- coche
- modificacion_motor
- valor_estimado
- creado_en

**avanzado_ejercicio_010_autos_backup** (Tabla de Respaldo)
- id (PK)
- piloto
- coche
- modificacion_motor
- valor_estimado
- creado_en
- respaldado_en

---

## Consultas y Operaciones de Respaldo

### 1. ¿Cuál es el estado original de la tabla de producción antes del respaldo?

```sql
SELECT id, piloto, coche, valor_estimado 
    FROM avanzado_ejercicio_010_autos;
```

**Resultado**

![Consulta 1](consulta_01.png)

---

### 2. Ejecución del Backup Lógico Interno

Copiamos todos los registros de la tabla principal a la tabla de backup para asegurar los datos.

```sql
INSERT INTO avanzado_ejercicio_010_autos_backup (id, piloto, coche, modificacion_motor, valor_estimado, creado_en)
SELECT id, piloto, coche, modificacion_motor, valor_estimado, creado_en 
    FROM avanzado_ejercicio_010_autos;
SELECT COUNT(*) AS registros_respaldados 
    FROM avanzado_ejercicio_010_autos_backup;
```

**Resultado**

![Consulta 2](consulta_02.png)

---

### 3. Backup Lógico Externo (Comando CLI `mysqldump`)

Para generar un archivo físico `.sql` portable, se debe ejecutar el siguiente comando en la terminal del sistema operativo (bash/cmd), fuera del cliente MySQL:

```bash
mysqldump -u root -p campuslands_mysql avanzado_ejercicio_010_autos > backup_carreras.sql
```

*(Esta operación no genera una salida de tabla, sino un archivo de texto con el DDL y DML estructurado).*

---

### 4. Simulación de desastre: Eliminación masiva accidental

Se eliminan por error todos los vehículos con valor menor a 100,000 de la tabla de producción.

```sql
DELETE FROM avanzado_ejercicio_010_autos 
    WHERE valor_estimado < 100000;
SELECT COUNT(*) AS registros_restantes 
    FROM avanzado_ejercicio_010_autos;
```

**Resultado**

![Consulta 4](consulta_04.png)

---

### 5. Restauración del Backup Lógico

Recuperamos los registros perdidos insertando desde la tabla de backup aquellos IDs que ya no existen en producción.

```sql
INSERT INTO avanzado_ejercicio_010_autos (id, piloto, coche, modificacion_motor, valor_estimado, creado_en)
SELECT id, piloto, coche, modificacion_motor, valor_estimado, creado_en 
    FROM avanzado_ejercicio_010_autos_backup
    WHERE id NOT IN (SELECT id 
        FROM avanzado_ejercicio_010_autos);
SELECT id, piloto, coche, valor_estimado 
    FROM avanzado_ejercicio_010_autos 
    ORDER BY id ASC;
```

**Resultado**

![Consulta 5](consulta_05.png)

---

## Herramientas

- MySQL / `mysqldump`
- MySQL Workbench
- Git
- GitHub

---

**Campuslands · Skill SQL**