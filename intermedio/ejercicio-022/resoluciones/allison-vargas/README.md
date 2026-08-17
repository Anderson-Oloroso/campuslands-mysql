# Resolucion Ejercicio 022 - Normalizacion 2FN para Animacion 3D

**Desarrollado por:** Allison Vargas  
**Entorno:** MySQL 8.0  

## Aplicacion de Segunda Forma Normal (2FN)
Para alcanzar la 2FN se eliminaron las dependencias funcionales parciales separando el modelo en tres entidades independientes:
1. `artistas`: Almacena la informacion de los creadores y sus especialidades.
2. `motores_render`: Mantiene los datos tecnicos y costos base de los software de procesamiento.
3. `proyectos_render`: Tabla transaccional que vincula los proyectos con sus respectivos artistas y motores mediante Foreign Keys.

## Instrucciones de Ejecuci�n
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

