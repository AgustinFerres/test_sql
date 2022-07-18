-- Catergorias y Productos

SELECT * FROM categorias;

SELECT * FROM productos;

SELECT * FROM productos
WHERE Discontinuado = 1;
-- No

SELECT * FROM emarket.productos
WHERE ProveedorID = 8;
-- Teatime Chocolate Biscuits
-- Sir Rodney's Marmalade
-- Sir Rodney's Scones
-- Scottish Longbreads 

SELECT * FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

SELECT * FROM productos
WHERE UnidadesStock < NivelReorden;
-- Si 


SELECT * FROM productos
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;

-- Clientes -------------------------------------------------------------------------------

SELECT Contacto, Compania, Titulo, Pais FROM clientes
ORDER BY Pais;

SELECT * FROM clientes
WHERE Titulo = 'Owner';

SELECT * FROM clientes
WHERE Contacto LIKE 'C%';

-- Facturas -------------------------------------------------------------------------------

SELECT * FROM facturas
ORDER BY FechaFactura;

SELECT * FROM facturas
WHERE PaisEnvio LIKE 'USA' AND EnvioVia != 3;

SELECT * FROM facturas
WHERE ClienteID LIKE 'GOURL';

SELECT * FROM facturas
WHERE EmpleadoID = 2 OR EmpleadoID = 3 OR EmpleadoID = 5 OR EmpleadoID = 8 OR EmpleadoID = 9;

-- Parte ||-----------------------------------------------------------------------------------

-- Productos


SELECT * FROM productos
ORDER BY PrecioUnitario DESC;

SELECT * FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

SELECT * FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

-- FacturaDetalle

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle;

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
ORDER BY Cantidad DESC;

SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100;

SELECT FacturaID AS NroFactura, ProductoID AS Producto, (PrecioUnitario * Cantidad) AS Total FROM facturadetalle;

-- EXTRAS ----------------------------------------------------------------------------------

SELECT * FROM clientes
WHERE Pais LIKE 'Brazil' OR Pais LIKE 'Mexico' OR Titulo LIKE 'Sales';


SELECT * FROM clientes
WHERE Compania LIKE 'A%';

SELECT * FROM facturas
WHERE FacturaID BETWEEN 10000 AND 10500;


