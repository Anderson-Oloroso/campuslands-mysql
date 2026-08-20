# ✨ Solución ejercicio avanzado: 12

## _Henrik Anderson Oloroso García 💯_

### Creación de las tablas 📑

Se crearon las tablas necesarias para la solución avanzada en **playlist musical**:
- `canciones_playlist`
- `detalles_playlist`
- `log_auditoria_canciones_playlist`

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
