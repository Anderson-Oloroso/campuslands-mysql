# ✨ Solución ejercicio intermedio: 17

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Se crearon dos tablas relacionadas para la temática **tienda de ropa**:
- `prendas_ropa` (Tabla principal con PK `prenda_id`)
- `ventas_prendas` (Tabla secundaria relacionada mediante FK `prenda_id`)

### Creación de registros 📝

Se insertaron registros de prueba en ambas tablas respetando la integridad referencial.

### Consultas ✅

Las consultas implementadas incluyen:
- `INNER JOIN` para unir ambas tablas.
- `LEFT JOIN` con agregación `COUNT`.
- `GROUP BY` y `HAVING` para filtrar métricas agrupadas.
- Subconsulta escalar.
- Creación y consulta de una `VIEW` de reporte consolidado.
