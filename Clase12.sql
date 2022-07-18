-- punto 1

SELECT * FROM cancion
WHERE titulo LIKE '%z%';

-- punto 2

SELECT * FROM cancion
WHERE titulo LIKE '_a%s';

-- punto 3

SELECT idPlaylist AS 'Id Playlist', idusuario AS 'Id Usuario', titulo AS Título, cantcanciones AS 'Cantidad Canciones', idestado AS 'Id Estado', Fechacreacion AS 'Fecha Creación', Fechaeliminada AS 'Fecha Eliminada' FROM playlist
ORDER BY cantcanciones DESC
LIMIT 1;

-- punto 4

SELECT * FROM usuario
ORDER BY fecha_nac DESC
LIMIT 10
OFFSET 5;

-- punto 5

SELECT * FROM cancion
ORDER BY cantreproduccion DESC
LIMIT 5;

-- punto 6

SELECT * FROM album
ORDER BY titulo;

-- punto 7

SELECT * FROM album
WHERE imagenportada IS NULL;

-- punto 8

-- INSERT INTO `proyecto_spotify`.`usuario` (`idUsuario`, `nombreusuario`, `nyap`, `fecha_nac`, `sexo`, `CP`, `password`, `Pais_idPais`) VALUES ('20', 'nuevousuariodespotify@gmail.com', 'ELMER GOMEZ', '1991-11-15', 'M', 'B4129ATF', 'S4321m', '2');

-- punto 10

-- UPDATE `proyecto_spotify`.`artista` 
-- SET `imagen` = "Imagen faltante" 
-- WHERE imagen IS NULL;
