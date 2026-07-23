SELECT * FROM skin_shooter;

SELECT * FROM inventario_skins;

SELECT 
    s.skin_name,
    s.skin_description,
    i.skin_quantity
FROM skin_shooter s
INNER JOIN inventario_skins i 
    ON s.skind_id = i.skin_id;

SELECT 
    s.skin_name,
    i.skin_quantity
FROM skin_shooter s
INNER JOIN inventario_skins i 
    ON s.skind_id = i.skin_id
WHERE i.skin_quantity > 10;

SELECT 
    s.skin_name,
    i.skin_quantity
FROM skin_shooter s
INNER JOIN inventario_skins i 
    ON s.skind_id = i.skin_id
ORDER BY i.skin_quantity DESC;