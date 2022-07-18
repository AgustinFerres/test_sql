-- punto 1

SELECT * FROM canciones
WHERE milisegundos > 120000;

-- punto 2

SELECT * FROM canciones
WHERE nombre LIKE 'A%' OR nombre LIKE 'E&' OR nombre LIKE 'I%' OR  nombre LIKE 'O%' OR nombre LIKE 'U%';

-- punto 3 

SELECT * FROM canciones
WHERE compositor IS NOT NULL
ORDER BY compositor DESC;

SELECT * FROM canciones
WHERE compositor IS NOT NULL
ORDER BY nombre;

-- punto 4

SELECT compositor, COUNT(*) FROM canciones
GROUP BY compositor
HAVING COUNT(*) > 10;

-- punto 5

SELECT pais_de_facturacion, ciudad_de_facturacion, SUM(total) FROM facturas
-- WHERE pais_de_facturacion LIKE 'CANADA'
GROUP BY pais_de_facturacion, ciudad_de_facturacion
HAVING SUM(total) > 38;

-- punto 6

SELECT generos.nombre, MIN(milisegundos / 60000) AS minimaDuracion, MAX(milisegundos / 60000) AS maxDuracion, AVG(milisegundos / 60000) AS promedioDeDuracion FROM canciones
INNER JOIN generos ON canciones.id_genero = generos.id
GROUP BY generos.nombre;

