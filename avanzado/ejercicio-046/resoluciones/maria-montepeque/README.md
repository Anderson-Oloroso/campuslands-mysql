# Resolucion - Ejercicio 046 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele la caja de un restaurante de comida urbana (`caja_avanzado`,
`pagos_mesas_avanzado`) y demostre tres escenarios de transacciones en
`dml/inserts.sql`:

1. **Pago exitoso** (Mesa 5 paga su cuenta completa):
   `START TRANSACTION` ... `COMMIT`.
2. **Pago con SAVEPOINT** (Mesa 8): se confirma la cuenta principal,
   se crea un `SAVEPOINT antes_de_propina`, se aplica una propina
   adicional y luego el cliente reclama que no queria dejarla:
   `ROLLBACK TO SAVEPOINT` deshace solo la propina, sin perder el pago
   principal ya aplicado.
3. **Pago cancelado** (Mesa 3, se retira sin pagar): `ROLLBACK`
   completo, no queda ningun rastro del cobro.

## Decisiones tecnicas
- `ENGINE=InnoDB` en ambas tablas (necesario para transacciones).
- `CHECK (monto_actual >= 0)`: la caja nunca puede quedar negativa.
- A diferencia de un fondo que se va agotando con cada pago, aqui la
  caja **crece** con cada pago recibido (`monto_actual = monto_actual
  + monto`), que es el comportamiento real de una caja registradora.
- La consulta 6 de `dql/consultas.sql` verifica consistencia
  recalculando `monto_actual` a partir de los pagos realmente
  confirmados, y comparandolo contra el valor guardado en la tabla.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado actual de la caja.
2. Pagos confirmados tras las transacciones.
3. Total recibido por mesa.
4. Confirmacion de que la propina de la Mesa 8 no quedo registrada.
5. Confirmacion de que el pago de la Mesa 3 no quedo registrado.
6. Verificacion de consistencia entre el monto actual y los pagos reales.
