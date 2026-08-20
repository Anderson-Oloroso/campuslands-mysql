# ✨ Solución ejercicio avanzado: 20

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Se crearon las tablas necesarias para la solución avanzada en **estudio de tatuajes**:
- `tatuajes_estudio`
- `citas_tatuajes`
- `log_auditoria_tatuajes_estudio`

### Creación de registros 📝

Se poblaron los datos iniciales con registros coherentes para verificar transacciones y funciones avanzadas.

### Transacciones 🔄

Se demostró el control transaccional mediante:
- `START TRANSACTION` con actualización y confirmación vía `COMMIT`.
- `START TRANSACTION` con prueba revertida vía `ROLLBACK`.

### Consultas ✅

Las consultas avanzadas incluyen:
- `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`
- CTE (`WITH cte_resumen AS (...)`)
- Join consolidado con historial ordenado cronológicamente.
