SELECT * FROM canciones;

SELECT UPPER(LEFT(nombre,10)) AS nombre FROM canciones;

										
SELECT UPPER(LEFT(nombre,10)) AS nombre,
		/* TRUNCATE((DATEDIFF(NOW(), publicada) / 365), 0) */ 
 CONCAT(TIMESTAMPDIFF(YEAR,publicada ,NOW()), ' años') AS 'Desde publicada',
 CONCAT(ROUND(bytes / 1024), ' KB') AS peso,
 CONCAT('$ ', FORMAT(precio_unitario, 3)) AS precio,
 (CASE
	WHEN compositor LIKE '' OR compositor IS NULL THEN '<sin datos>'
    WHEN compositor NOT LIKE '%,%' THEN compositor
    ELSE LEFT(compositor, LOCATE(',', compositor) - 1)
    END) AS compositor,
    COUNT(*)
FROM canciones
GROUP BY compositor
ORDER BY COUNT(*) DESC;