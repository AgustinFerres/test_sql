/* CHECKPOINT 3 */
					/* 
					Docente: Lucas Catardo
						Grupo 6, integrado por:
												Agustín Ferrés
												Gonzalo Alvarez
												Pablo Velez
												Florencia Lecha
																*/
-- 1.

SELECT * 
FROM reservas
INNER JOIN hotelesxreserva ON reservas.idreserva = hotelesxreserva.idReserva
INNER JOIN hoteles ON hotelesxreserva.idHotel = hoteles.idhotel
WHERE hoteles.ciudad LIKE 'Napoles';

/* cantidad registros: 6   */

-- 2. 

SELECT 
	pagos.idpago,
    pagos.precioTotal,
    pagos.cantidadCuotas
FROM pagos
INNER JOIN reservas ON pagos.idpago = reservas.idPago
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
WHERE metodospago.nombre LIKE '%credito%';

/* cantidad registros: 19   */

-- 3. 

SELECT 
	metodospago.nombre AS 'Metodo de Pago',
    COUNT(*) AS 'Cantidad Reservas'
FROM pagos
INNER JOIN reservas ON pagos.idpago = reservas.idPago
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
GROUP BY metodospago.nombre;

/* cantidad registros: 3   */

-- 4.

SELECT 
	clientes.nombres,
    clientes.apellidos,
    paises.nombre AS Pais,
    metodospago.nombre AS 'Metodo de Pago'
FROM reservas
INNER JOIN clientes ON reservas.idCliente = clientes.idcliente
INNER JOIN paises ON clientes.idPais = paises.idpais
INNER JOIN pagos ON reservas.idPago = pagos.idpago
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
WHERE metodospago.nombre LIKE '%credito%';

/* cantidad registros: 19   */

-- 5. 

SELECT 
	paises.nombre,
    COUNT(*) AS 'Cantidad Reservas'
FROM reservas
INNER JOIN hotelesxreserva ON reservas.idreserva = hotelesxreserva.idReserva
INNER JOIN hoteles ON hotelesxreserva.idHotel = hoteles.idhotel
INNER JOIN paises ON hoteles.idPais = paises.idpais
GROUP BY paises.nombre;

/* cantidad registros: 8  */


-- 6.

SELECT 
	clientes.nombres, 
    clientes.apellidos, 
    clientes.numeroPasaporte,
    clientes.ciudad,
	paises.nombre AS Pais
FROM clientes
INNER JOIN paises ON clientes.idPais = paises.idpais
WHERE paises.nombre LIKE '%Peru%';

/* cantidad registros: 5   */

-- 7.

SELECT 
	CONCAT(clientes.nombres,' ', clientes.apellidos) AS 'Nombre Completo',
    COUNT(*) AS 'Cantidad Reservas',
    metodospago.nombre AS 'Metodo de Pago'
FROM pagos
INNER JOIN reservas ON pagos.idpago = reservas.idPago
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
INNER JOIN clientes ON reservas.idCliente = clientes.idcliente
GROUP BY metodospago.nombre, CONCAT(clientes.nombres,' ', clientes.apellidos);

/* cantidad registros: 51   */

-- 8.

SELECT COUNT(*) AS 'Cantidad de clientes', paises.nombre FROM clientes
INNER JOIN paises ON clientes.idPais = paises.idPais
GROUP BY paises.nombre;

/* cantidad registros: 11   */

-- 9.

SELECT hoteles.nombre, hoteles.direccion, hoteles.ciudad, paises.nombre FROM hoteles
INNER JOIN paises ON hoteles.idPais = paises.idPais
INNER JOIN hotelesxreserva ON hotelesxreserva.idHotel = hoteles.idhotel
INNER JOIN tiposhospedaje ON hotelesxreserva.idTiposHospedaje = tiposhospedaje.idtiposhospedaje
WHERE tiposhospedaje.nombre = 'Media Pension';

/* cantidad registros: 22   */

-- 10.

SELECT metodospago.nombre, SUM(pagos.precioTotal) AS Total FROM pagos
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
GROUP BY metodospago.nombre;

/* cantidad registros: 3   */

-- 11.

SELECT 
	CONCAT('$ ', SUM(pagos.precioTotal)) AS 'TOTAL MENDOZA'
FROM pagos
INNER  JOIN reservas ON pagos.idpago = reservas.idPago
INNER JOIN sucursales ON reservas.idSucursal = sucursales.idSucursal
WHERE sucursales.ciudad LIKE '%MENDOZA%';	

/* cantidad registros: 1   */

-- 12.

SELECT * 
FROM clientes
LEFT JOIN reservas ON clientes.idcliente = reservas.idCliente
WHERE reservas.idCliente IS NULL;

/* cantidad registros: 33   */

-- 13.

SELECT reservas.idreserva, vuelos.idvuelo, vuelos.fechaPartida, vuelos.fechaLlegada, reservas.fechaRegistro FROM reservas
INNER JOIN vuelosxreserva ON reservas.idreserva = vuelosxreserva.idReserva
INNER JOIN vuelos ON vuelosxreserva.idVuelo = vuelos.idvuelo
WHERE vuelos.origen = 'Chile' AND vuelos.destino = 'Ecuador';

/* cantidad registros: 3   */

-- 14.

SELECT 
	hoteles.nombre,
    hoteles.cantidadHabitaciones
FROM hoteles
INNER JOIN paises ON hoteles.idPais = paises.idPais
WHERE hoteles.cantidadHabitaciones BETWEEN 	30 AND 70 AND paises.nombre = 'Argentina';

/* cantidad registros: 3   */

-- 15. 

SELECT hoteles.nombre, COUNT(*) AS 'Cantidad de reservas' FROM hoteles
INNER JOIN hotelesxreserva ON hoteles.idhotel = hotelesxreserva.idHotel
INNER JOIN reservas ON hotelesxreserva.idReserva = reservas.idreserva
GROUP BY hoteles.nombre
ORDER BY COUNT(*) DESC
LIMIT 10;

/* cantidad registros: 10   */

-- 16.
 
SELECT CONCAT(clientes.nombres, ' ', clientes.apellidos) AS 'Nombre cliente', metodospago.nombre AS 'Metodo de pago'FROM clientes
INNER JOIN reservas ON reservas.idCliente = clientes.idcliente
INNER JOIN pagos ON reservas.idPago = pagos.idpago
INNER JOIN metodospago ON pagos.idMetodosPago = metodospago.idmetodospago
ORDER BY clientes.apellidos ASC;

/* cantidad registros: 62   */

-- 17. 

SELECT 
	vuelos.origen,
    COUNT(*) AS 'Cantidad reservas'
FROM reservas
INNER JOIN vuelosxreserva ON reservas.idreserva = vuelosxreserva.idReserva
INNER JOIN vuelos ON vuelosxreserva.idVuelo = vuelos.idvuelo
WHERE 
	(vuelos.origen LIKE 'argentina' 
    OR vuelos.origen LIKE 'colombia') 
    AND HOUR(vuelos.fechaPartida) = 18
GROUP BY vuelos.origen;

/* cantidad registros: 1   */

-- 18.
 
SELECT 
	paises.nombre AS Pais,
    CONCAT('$ ', SUM(pagos.precioTotal)) AS 'Total de ventas'
FROM sucursales
INNER JOIN reservas ON  sucursales.idSucursal = reservas.idSucursal
INNER  JOIN pagos ON reservas.idPago = pagos.idpago
INNER JOIN paises ON sucursales.idpais = paises.idpais
GROUP BY paises.nombre
ORDER BY SUM(pagos.precioTotal) DESC;

/* cantidad registros: 2   */

-- 19.

SELECT *
FROM paises
LEFT JOIN clientes ON paises.idpais = clientes.idPais
WHERE clientes.idPais IS NULL
ORDER BY paises.nombre DESC;

/* cantidad registros: 19   */

-- 20.

SELECT 
	hoteles.nombre AS Hotel,
    COUNT(*) AS 'Cantidad Reservas'
FROM hoteles
INNER JOIN hotelesxreserva ON hoteles.idhotel = hotelesxreserva.idHotel
GROUP BY hoteles.nombre
HAVING COUNT(*) > 2;

/* cantidad registros: 4   */














































