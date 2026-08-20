# ✈️ Ejercicio 018 - GROUP BY para Viajes y Turismo

## 📌 Descripción del Proyecto
Este proyecto implementa reportes consolidados y análisis de datos en MySQL utilizando **GROUP BY** sobre el sistema de **Viajes y Turismo**. Permite evaluar la rotación de reservas, ingresos agrupados por tour o destino, hábitos de consumo por nacionalidad y filtrado sobre agregados con `HAVING`.

---

## 🏗️ Estructura de la Base de Datos

La base de datos `intermedio_viajes_turismo` consta de 4 tablas relacionales:

* **`destinos_018`**: Registro de países y ciudades con sus tarifas base.
* **`turistas_018`**: Información demográfica y de origen de los viajeros.
* **`tours_018`**: Catálogo de experiencias de viaje en cada destino.
* **`reservas_018`**: Mapeo de boletos comprados con montos finales e integrantes por grupo.

---

## 📊 Capacidades Demostradas con GROUP BY

1. **Métricas Agregadas:** Uso de `SUM()`, `AVG()` y `COUNT()` para totalizar ingresos y dimensionar la demanda por destino.
2. **Filtro Transaccional con `HAVING`:** Evaluación de condiciones posteriores al agrupamiento (ej. paquetes turísticos con ingresos superiores a un valor tope o clientes recurrentes).
3. **Mapeo Demográfico:** Consolidación de viajeros según su nacionalidad de origen.

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para crear las tablas y relaciones.
2. Ejecuta el script **DML** para cargar datos transaccionales de viajes.
3. Corre el script **DQL** para generar los reportes agrupados.