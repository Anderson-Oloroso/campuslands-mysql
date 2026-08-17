USE soldadura_fk_db;

-- Consulta 1: Reporte detallado cruzando Inspectores con sus Inspecciones (JOIN sobre FK)
SELECT 
    i.codigo_junta AS 'Junta Ensayada',
    insp.nombre_inspector AS 'Inspector Responsable',
    insp.certificacion_nivel AS 'Nivel Certificacion',
    i.tipo_ensayo AS 'Metodo NDT',
    i.resultado AS 'Dictamen Final',
    i.costo_ensayo_usd AS 'Costo (USD)'
FROM inspecciones_calidad i
JOIN inspectores insp ON i.id_inspector = insp.id_inspector
ORDER BY i.fecha_inspeccion DESC;

-- Consulta 2: Total de dinero invertido y ensayos realizados por cada inspector
SELECT 
    insp.nombre_inspector AS 'Inspector',
    COUNT(i.id_inspeccion) AS 'Total Inspecciones',
    SUM(i.costo_ensayo_usd) AS 'Monto Total Ensayos (USD)'
FROM inspectores insp
LEFT JOIN inspecciones_calidad i ON insp.id_inspector = i.id_inspector
GROUP BY insp.id_inspector, insp.nombre_inspector
ORDER BY `Monto Total Ensayos (USD)` DESC;

-- Consulta 3: Inspecciones con resultados no conformes (Rechazados o Reparacion)
SELECT 
    i.codigo_junta AS 'Junta Con Falla',
    insp.nombre_inspector AS 'Evaluador',
    i.tipo_ensayo AS 'Tipo Ensayo',
    i.resultado AS 'Estado'
FROM inspecciones_calidad i
JOIN inspectores insp ON i.id_inspector = insp.id_inspector
WHERE i.resultado IN ('rechazado', 'requiere_reparacion')
ORDER BY i.fecha_inspeccion ASC;

-- Consulta 4: Distribucion del gasto e inspecciones por tipo de ensayo NDT
SELECT 
    tipo_ensayo AS 'Metodo de Ensayos Non-Destructive',
    COUNT(*) AS 'Total Aplicados',
    ROUND(AVG(costo_ensayo_usd), 2) AS 'Costo Promedio (USD)',
    SUM(costo_ensayo_usd) AS 'Costo Acumulado (USD)'
FROM inspecciones_calidad
GROUP BY tipo_ensayo
ORDER BY `Costo Acumulado (USD)` DESC;

-- Consulta 5: Top 3 de inspectores con mas juntas evaluadas exitosamente (Aprobadas)
SELECT 
    insp.nombre_inspector AS 'Inspector Estrella',
    insp.certificacion_nivel AS 'Nivel',
    COUNT(i.id_inspeccion) AS 'Juntas Aprobadas'
FROM inspectores insp
JOIN inspecciones_calidad i ON insp.id_inspector = i.id_inspector
WHERE i.resultado = 'aprobado'
GROUP BY insp.id_inspector, insp.nombre_inspector, insp.certificacion_nivel
ORDER BY `Juntas Aprobadas` DESC
LIMIT 3;
