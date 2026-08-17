# Resolucion - Ejercicio 044 (avanzado)

## Autor
maria-montepeque

## Que hice
Modele transmisiones en vivo de episodios de una saga de ciencia
ficcion (`transmisiones_avanzado`, `auditoria_transmisiones_avanzado`)
y cree un **Event Scheduler** (`ev_finalizar_transmisiones_avanzado`)
que revisa cada hora si alguna transmision ya termino (`fecha_fin <
NOW()`) y la marca como `'finalizada'`, dejando rastro en la
auditoria. Nadie tiene que acordarse de correr ese `UPDATE` a mano.

Las fechas de `dml/inserts.sql` se calculan con `DATE_SUB(NOW(), ...)`
y `DATE_ADD(NOW(), ...)` en vez de fechas fijas de 2026, a proposito:
este ejercicio es sobre automatizacion basada en tiempo, asi que
interesa que el escenario (algunas transmisiones ya vencidas, otras
vigentes, otras futuras) sea real sin importar cuando se ejecute el
script.

## Verificacion real de que el evento se dispara solo
No me quede en la teoria. Cree una copia temporal del mismo evento,
programada para dispararse 3 segundos despues
(`ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 3 SECOND`), y esta fue
la secuencia real:

1. Antes: 3 transmisiones (`El Despertar de la Nebulosa`,
   `La Sombra del Imperio`, `La Caida de Orion`) ya tenian
   `fecha_fin < NOW()` pero seguian en estado `programada`/`en_vivo`.
2. Espere 8 segundos **sin ejecutar ningun `UPDATE` manual**.
3. Despues: las 3 transmisiones aparecieron en estado `'finalizada'`,
   y la tabla `auditoria_transmisiones_avanzado` tenia exactamente 3
   filas nuevas, una por cada transmision, con la hora real de
   ejecucion (`2026-07-25 02:06:53`).
4. El evento de prueba (`ON SCHEDULE AT`, de una sola vez) desaparecio
   solo de `SHOW EVENTS`/`information_schema.EVENTS` al terminar — el
   comportamiento por defecto de MySQL (`ON COMPLETION NOT PRESERVE`)
   para eventos `ONE TIME`.

El evento real de este ejercicio (`ev_finalizar_transmisiones_avanzado`)
es `RECURRING` (`EVERY 1 HOUR`) y sigue activo (`ENABLED`) despues de
correr `dml/inserts.sql`; la consulta 6 de `dql/consultas.sql` lo
confirma consultando `information_schema.EVENTS`.

## Decisiones tecnicas
- El `INSERT` en la auditoria va **antes** del `UPDATE`, filtrando por
  el estado viejo (`'programada'`/`'en_vivo'`): asi cada transmision se
  registra una sola vez, la primera vez que el evento la encuentra
  vencida. En ejecuciones posteriores ya no calificara para el
  `INSERT` porque su estado ya sera `'finalizada'` (evento
  idempotente).
- `ENGINE=InnoDB` en ambas tablas.
- `CHECK (fecha_fin > fecha_inicio)` para que una transmision siempre
  tenga una duracion valida.

## Como ejecutar
```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < ddl/schema.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dml/inserts.sql
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 < dql/consultas.sql
```

## Consultas incluidas
1. Estado actual de todas las transmisiones.
2. Transmisiones ya finalizadas por el event scheduler.
3. Bitacora generada automaticamente.
4. Transmisiones vigentes en este momento.
5. Transmisiones que todavia no empiezan.
6. Detalle del event scheduler configurado (`information_schema.EVENTS`).
