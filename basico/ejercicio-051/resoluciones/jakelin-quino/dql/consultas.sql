-- 1. Dibujos digitales
SELECT titulo, artista, precio FROM `ejercicio-051-bas-dibujos` WHERE tecnica = 'digital';

-- 2. Dibujos con precio mayor a 200
SELECT titulo, artista, tecnica, precio FROM `ejercicio-051-bas-dibujos` WHERE precio > 200;

-- 3. Dibujos grandes o pequeños
SELECT titulo, artista, tamanio FROM `ejercicio-051-bas-dibujos` WHERE tamanio IN ('grande', 'pequeño');