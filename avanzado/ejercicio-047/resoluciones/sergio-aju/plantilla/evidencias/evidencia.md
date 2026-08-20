# Ejercicio 047 - Módulo de Procedimientos Almacenados: Tienda de Ropa

## Descripción de la Solución
Este módulo implementa lógica de negocio encapsulada mediante **Procedimientos Almacenados (`STORED PROCEDURES`)** en MySQL para una tienda de ropa. La arquitectura automatiza la validación de inventario, el cálculo de descuentos dinámicos según el tipo de cliente, el reabastecimiento de prendas y la generación de reportes paramétricos.

## Decisiones Técnicas y Lógica Implementada
- **Procedimientos Almacenados:**
  - `sp_registrar_venta`: Controla la transacción de venta, verifica stock disponible, aplica un 10% de descuento automático a clientes `VIP`, inserta el encabezado/detalle y descuenta las existencias actualizando el estado a `agotado` si llega a cero.
  - `sp_reabastecer_stock`: Incrementa las existencias físicas de una prenda y reactiva su estado a `disponible`.
  - `sp_reporte_inventario_categoria`: Consulta optimizada que filtra catálogo por categoría y tope de precio.
- **Manejo de Excepciones:** Se implementó `SIGNAL SQLSTATE '45000'` para lanzar errores personalizados cuando el stock es insuficiente o el producto no existe.

## Estructura del Proyecto
```text
avanzado/ejercicio-047/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql