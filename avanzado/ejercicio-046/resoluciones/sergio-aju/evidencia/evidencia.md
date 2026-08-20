# Ejercicio 046 - Módulo de Transacciones: Restaurante de Comida Urbana

## Descripción de la Solución
Este módulo implementa el control transaccional para el procesamiento de pedidos en un restaurante de comida urbana (*Street Food*). La solución garantiza las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad) mediante MySQL Engine **InnoDB**, coordinando la creación de pedidos, el registro de su detalle, el descuento automático de inventario y la asignación de puntos de fidelización.

## Decisiones Técnicas y Arquitectura
- **Motor InnoDB:** Elegido explícitamente por su soporte nativo de llaves foráneas (`FOREIGN KEY`) y transacciones relacionales.
- **Transaccionalidad (ACID):**
  - Se utilizan bloques `START TRANSACTION`, `COMMIT` y `ROLLBACK`.
  - Si una venta involucra múltiples items y actualización de inventario, todos los pasos deben ser exitosos de forma indivisible.
- **Estructura Relacional:** Separación clara entre `clientes`, `productos` (menú/inventario), `pedidos` (encabezado) y `detalle_pedidos`.
- **Integridad de Datos:** Restricciones `CHECK` para evitar precios, saldos o stock negativos, campos calculados (`STORED` subtotal) y restricciones de integridad referencial.

## Estructura del Proyecto
```text
avanzado/ejercicio-046/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql