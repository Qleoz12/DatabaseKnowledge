USE DB1
(SELECT id, oficina, idMunicipio, Municipio, idDepartamento, departamento, grupoCiudadTRamite, valor, usuarioCreacion, fechaCreacion, horaCreacion, usuarioActualizacion, fechaActualizacion, horaActualizacion
into DB2.dbo.oficinas	
FROM (
SELECT ROW_NUMBER()
OVER(PARTITION BY idMunicipio
ORDER BY id DESC) AS StRank, *
FROM admincredito.dbo.oficinas) n
WHERE StRank = 1);