/* CLIENTES */

-- punto 1

-- CREATE VIEW vw_clientes ASvw_clientes
SELECT 
	ClienteID,
    Contacto,
    (CASE
		WHEN Fax IS NULL OR Fax LIKE '' THEN CONCAT('TEL: ',Telefono)
        ELSE Fax
	END) AS fax
FROM clientes;

-- punto 2

SELECT * FROM clientes 
WHERE Fax IS NULL OR Fax LIKE '';

SELECT * FROM vw_clientes
WHERE Fax LIKE 'TEL: %';


/* Proveedores */

-- punto 1

-- CREATE VIEW vw_proveedores AS
SELECT 
	ProveedorID,
    Contacto,
    Compania,
    CONCAT(Direccion, ' ', Ciudad, ' ', CodigoPostal, ' ', Pais) AS Direccion
FROM proveedores;

-- punto 2

SELECT * FROM proveedores
WHERE Direccion LIKE '%americanas%' AND  Pais LIKE 'Brazil';

SELECT * FROM vw_proveedores
WHERE Direccion LIKE '%americanas%Brazil%';

/* Parte || */

-- punto 1

-- CREATE VIEW vw_productos AS
SELECT 
	ProductoID,
    ProductoNombre,
    CONCAT('$ ', ROUND(PrecioUnitario)) AS Precio,
    UnidadesStock,
    UnidadesPedidas,
    (CASE
		WHEN UnidadesPedidas = 0 THEN 'BAJA'
        WHEN UnidadesPedidas < UnidadesStock THEN 'MEDIA'
        WHEN (UnidadesPedidas * 2) < UnidadesStock THEN 'URGENTE'
        WHEN (UnidadesPedidas * 2) > UnidadesStock THEN 'SUPER URGENTE'
    END) AS Prioridad
FROM productos;

-- punto 2

SELECT 
	Prioridad,
    COUNT(*) AS Cantidad,
    CONCAT('$ ', AVG(REPLACE(Precio,'$ ', ''))) AS Promedio
FROM vw_productos
GROUP BY Prioridad
HAVING COUNT(*) > 5;














