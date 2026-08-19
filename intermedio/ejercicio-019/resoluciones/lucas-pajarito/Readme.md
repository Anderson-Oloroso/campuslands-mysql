# 🪂 Ejercicio 019 - HAVING para Paracaidismo

## 📌 Descripción del Proyecto
Este proyecto implementa consultas analíticas avanzadas para una academia de **Paracaidismo** utilizando la cláusula **`HAVING`** en MySQL. A diferencia de `WHERE` (que filtra filas individuales antes de agrupar), `HAVING` permite evaluar y filtrar condiciones aplicadas sobre métricas consolidadas o agrupadas (`SUM`, `COUNT`, `AVG`).

---

## 🏗️ Estructura de la Base de Datos

La base de datos `intermedio_paracaidismo` consta de 4 tablas relacionales:

* **`zonas_salto_019`**: Catálogo de centros de salto (*dropzones*) registrados.
* **`instructores_019`**: Personal técnico y credenciales de instrucción.
* **`paracaidistas_019`**: Directorio de miembros y niveles de experiencia.
* **`saltos_019`**: Registro de operaciones transaccionales (altitud, zona, instructor y costo).

---

## 📊 Casos de Uso Técnico Demostrados

1. **Filtrado por Frecuencia Operativa:** Identificación de paracaidistas recurrentes mediante `HAVING COUNT(s.id) > 2`.
2. **Uso de Filtros Mixtos (`WHERE` + `HAVING`):** Filtrado previo de filas por altitud (`WHERE s.altitud_pies >= 12000`) seguido del filtrado de agregados sobre el subconjunto generado (`HAVING saltos_alta_altitud > 1`).
3. **Métricas Financieras Agregadas:** Control de ingresos mínimos por instructor y promedios por nivel de certificación.

---

## 🚀 Guía de Ejecución

1. Ejecuta el script **DDL** para estructurar las tablas e índices relacionales.
2. Ejecuta el script **DML** para cargar la información transaccional de saltos.
3. Ejecuta el script **DQL** para verificar los reportes consolidados mediante la cláusula `HAVING`.