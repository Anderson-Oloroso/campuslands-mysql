# Ejercicio 048 - Módulo de Funciones SQL: Viajes y Turismo

## Descripción de la Solución
Este módulo desarrolla el motor de cálculo de cotizaciones e indicadores para una agencia de viajes y turismo. Aprovecha **Funciones Almacenadas (`STORED FUNCTIONS`)** personalizadas junto a funciones nativas de MySQL (`DATEDIFF`, `DATE_FORMAT`, `ROUND`, `FORMAT`, `CONCAT`) para automatizar el cálculo de noches de estancia, sobrecargos por temporada alta y categorización comercial de destinos.

## Funciones SQL Implementadas
1. `fn_calcular_dias_estancia(fecha_inicio, fecha_fin)`: Retorna la cantidad de días transcurridos entre el check-in y check-out.
2. `fn_calcular_costo_reserva(precio_noche, dias, personas, es_temporada_alta)`: Aplica lógica de negocio para liquidar el precio total, incorporando un 20% adicional cuando el paquete se marca en temporada alta.
3. `fn_clasificar_gama_paquete(precio)`: Retorna la categoría comercial (`Económica`, `Estándar`, `Premium / Lujo`) según rangos tarifarios.

## Estructura del Proyecto
```text
avanzado/ejercicio-048/resoluciones/tu-nombre-apellido/
├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql