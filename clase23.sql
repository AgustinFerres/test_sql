
-- 1.

DELIMITER $$
CREATE PROCEDURE sp_listemployees() 
BEGIN
	SELECT CONCAT(Nombre, ' ', Apellido) AS nombre FROM empleados
    ORDER BY nombre; 
END   $$


CALL sp_listemployees();

-- 2.

DELIMITER $$
CREATE PROCEDURE sp_lisemployeesXcity(IN nombreCiudad VARCHAR(15))
BEGIN
	SELECT CONCAT(Nombre, ' ', Apellido) AS nombre FROM empleados
    WHERE Ciudad = nombreCiudad;
END $$

CALL sp_lisemployeesXcity('seattle');


-- 3. 

DELIMITER $$
CREATE PROCEDURE sp_clientesXpais(IN varpais VARCHAR(15))
BEGIN
	SELECT COUNT(*) AS cantidad FROM clientes
    WHERE Pais = varpais;
END $$

CALL sp_clientesXpais('portugal');


-- 4.

DELIMITER $$
CREATE PROCEDURE sp_productosXstock (IN numero SMALLINT)
BEGIN
	SELECT ProductoNombre, UnidadesStock, categorias.CategoriaNombre FROM productos
    INNER JOIN categorias ON productos.CategoriaID = categorias.CategoriaID
    WHERE UnidadesStock < numero;
END $$

CALL sp_productosXstock(10);
CALL sp_productosXstock(1);


-- 5.

DELIMITER $$
CREATE PROCEDURE sp_productosXventasXdescuento (IN numero SMALLINT)
BEGIN
	SELECT ProductoNombre, clientes.Contacto FROM productos
    INNER JOIN facturadetalle ON productos.ProductoID = facturadetalle.ProductoID
    INNER JOIN facturas ON facturadetalle.FacturaID = facturas.FacturaID
    INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
    WHERE facturadetalle.Descuento >= numero;
END $$


CALL sp_productosXventasXdescuento(0.10)
