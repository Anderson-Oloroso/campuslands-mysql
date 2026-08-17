# Resolucion - Ejercicio 031 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele el fondo de premios de un torneo esports MOBA
(`premio_pool_avanzado`, `pagos_equipos_avanzado`) y demostre tres
escenarios de transacciones en `dml/inserts.sql`:

1. **Pago exitoso** (Furia Andina, campeon de la final):
   `START TRANSACTION` ... `COMMIT`.
2. **Pago con SAVEPOINT** (Nightfall Esports, semifinal): se confirma
   el pago principal, se crea un `SAVEPOINT antes_del_bono`, se aplica
   un bono adicional y luego el organizador decide no otorgarlo:
   `ROLLBACK TO SAVEPOINT` deshace solo el bono, sin perder el pago
   principal ya aplicado.
3. **Pago cancelado** (Dragones del Norte, descalificado tras
   cuartos): `ROLLBACK` completo, no queda ningun rastro del pago.

## Decisiones tecnicas
- `ENGINE=InnoDB` en ambas tablas (necesario para transacciones).
- `CHECK (monto_disponible >= 0)`: el fondo nunca puede quedar
  negativo, sin importar cuantos pagos se hagan.
- La consulta 6 de `dql/consultas.sql` verifica consistencia
  recalculando `monto_disponible` a partir de los pagos realmente
  confirmados, y comparandolo contra el valor guardado en la tabla.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado actual del fondo de premios.
2. Pagos confirmados tras las transacciones.
3. Total pagado por equipo.
4. Confirmacion de que el bono de Nightfall Esports no quedo registrado.
5. Confirmacion de que el pago a Dragones del Norte no quedo registrado.
6. Verificacion de consistencia entre el fondo disponible y los pagos reales.
