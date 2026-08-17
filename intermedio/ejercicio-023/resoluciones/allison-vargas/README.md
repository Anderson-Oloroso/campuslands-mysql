# Resolucion Ejercicio 023 - Normalizacion 3FN para Arquitectura 3D

**Desarrollado por:** Allison Vargas  
**Dificultad:** Intermedio Aplicado  
**Entorno:** MySQL 8.0  

## Aplicacion de la Tercera Forma Normal (3FN)
Para eliminar la redundancia y dependencias transitivas presentes en los modelos no normalizados:
1. `clientes`: Se separo la informacion propia de los clientes (nombre, email, pais).
2. `estudios_render`: Se independizaron los datos del estudio de renderizado y sus tarifas base.
3. `proyectos_3d`: Almacena exclusivamente los atributos del proyecto relacionando las llaves foraneas `id_cliente` e `id_estudio`.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
