# Ejercicio 049 - Módulo de Triggers: Centro de Paracaidismo

## Descripción de la Solución
Este módulo aplica **Triggers (disparadores)** en MySQL para automatizar la seguridad aérea, el control de horas de vuelo/caída libre y el monitoreo de equipos en un centro de paracaidismo.

## Triggers Implementados
1. `trg_validar_altitud_licencia` (`BEFORE INSERT`): Aplica restricciones de seguridad. Si se intenta registrar un salto superior a 15,000 pies para un paracaidista con licencia menor a `C` o `D`, o si el atleta no está activo, rechaza la operación con `SIGNAL SQLSTATE`.
2. `trg_actualizar_estadisticas_paracaidista` (`AFTER INSERT`): Suma de forma automática +1 al contador de saltos y acumula los minutos de caída libre en la tabla del paracaidista.
3. `trg_auditar_cambio_estado_equipo` (`AFTER UPDATE`): Registra trazabilidad de auditoría cuando un paracaídas cambia de estado (`operativo`, `mantenimiento`, `retirado`).

## Estructura del Proyecto
```text
avanzado/ejercicio-049/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql