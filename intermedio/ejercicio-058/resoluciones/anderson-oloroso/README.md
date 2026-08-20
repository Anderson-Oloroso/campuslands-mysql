# ✨ Solución ejercicio intermedio: 58

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Se crearon dos tablas relacionadas para la temática **academia tech**:
- `cursos_tech` (Tabla principal con PK `curso_id`)
- `estudiantes_tech` (Tabla secundaria relacionada mediante FK `curso_id`)

### Creación de registros 📝

Se insertaron registros de prueba en ambas tablas respetando la integridad referencial.

### Consultas ✅

Las consultas implementadas incluyen:
- `INNER JOIN` para unir ambas tablas.
- `LEFT JOIN` con agregación `COUNT`.
- `GROUP BY` y `HAVING` para filtrar métricas agrupadas.
- Subconsulta escalar.
- Creación y consulta de una `VIEW` de reporte consolidado.
