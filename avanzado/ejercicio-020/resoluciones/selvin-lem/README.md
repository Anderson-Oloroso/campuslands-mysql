# Resolucion - Ejercicio 020 (Avanzado) - Selvin Lem

## Tematica
Estudio de tatuajes

## Como ejecutar
1. Ejecutar `ddl/schema.sql` para crear la tabla estudio_tatuajes y sus índices (`idx_tatuajes_categoria`, `idx_tatuajes_estado`, `idx_tatuajes_cat_estado`).
2. Ejecutar `dml/inserts.sql` para insertar 8 registros de prueba de diseños y estilos de tatuaje.
3. Ejecutar `dql/consultas.sql` para correr las consultas optimizadas con filtros por estado, agregaciones COUNT, AVG y consultas compuestas.

## Entidad principal
- Tabla: estudio_tatuajes
- Atributos clave: nombre, categoria, puntaje, estado

## Restriccion aplicada
Uso de índices simples y compuestos en los campos `categoria` y `estado` para acelerar la velocidad de filtrado, sumado al `ENUM` en estado ('activo','revision','inactivo').

## Caso limite incluido
Búsqueda de estilos especializados en estado de revision o inactivos con puntajes bajos, filtrados velozmente a través de índices sin requerir escaneo completo de la tabla (*full table scan*).