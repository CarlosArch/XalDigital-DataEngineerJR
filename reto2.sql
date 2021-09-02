DROP TABLE IF EXISTS aerolineas;
DROP TABLE IF EXISTS aeropuertos;
DROP TABLE IF EXISTS movimientos;
DROP TABLE IF EXISTS vuelos;

CREATE TABLE aerolineas (
    id_aerolinea     INT  PRIMARY KEY
   ,nombre_aerolinea TEXT
);

CREATE TABLE aeropuertos (
    id_aeropuerto    INT PRIMARY KEY
   ,nombre_aeropuerto TEXT
);

CREATE TABLE movimientos (
    id_movimiento INT PRIMARY KEY
   ,descripcion   TEXT
);

CREATE TABLE vuelos (
    id_aerolinea  INT
   ,id_aeropuerto INT
   ,id_movimiento INT
   ,dia           TEXT
   ,FOREIGN KEY(id_aerolinea) REFERENCES aerolineas (id_aerolinea)
   ,FOREIGN KEY(id_aeropuerto) REFERENCES aeropuertos (id_aeropuerto)
   ,FOREIGN KEY(id_movimiento) REFERENCES movimientos (id_movimiento)
);

INSERT INTO aerolineas (
    id_aerolinea
   ,nombre_aerolinea
) VALUES
    (1 ,'Volaris'   )
   ,(2 ,'Aeromar'   )
   ,(3 ,'Interjet'  )
   ,(4 ,'Aeromexico')
;

INSERT INTO aeropuertos (
    id_aeropuerto
   ,nombre_aeropuerto
) VALUES
    (1 ,'Benito Juarez')
   ,(2 ,'Guanajuato'   )
   ,(3 ,'La paz'       )
   ,(4 ,'Oaxaca'       )
;

INSERT INTO movimientos (
    id_movimiento
   ,descripcion
) VALUES
    (1 ,'Salida' )
   ,(2 ,'Llegada')
;

INSERT INTO vuelos (
    id_aerolinea
   ,id_aeropuerto
   ,id_movimiento
   ,dia
) VALUES
    (1 ,1 ,1 ,'2021-05-02')
   ,(2 ,1 ,1 ,'2021-05-02')
   ,(3 ,2 ,2 ,'2021-05-02')
   ,(4 ,3 ,2 ,'2021-05-02')
   ,(1 ,3 ,2 ,'2021-05-02')
   ,(2 ,1 ,1 ,'2021-05-02')
   ,(2 ,3 ,1 ,'2021-05-04')
   ,(3 ,4 ,1 ,'2021-05-04')
   ,(3 ,4 ,1 ,'2021-05-04')
;

-- SELECT * FROM aerolineas;
-- SELECT * FROM aeropuertos;
-- SELECT * FROM movimientos;
-- SELECT * FROM vuelos;


-- 1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
SELECT
    aeropuertos.nombre_aeropuerto
FROM
    vuelos
LEFT JOIN
    aeropuertos ON
        vuelos.id_aeropuerto = aeropuertos.id_aeropuerto
GROUP BY
    vuelos.id_aeropuerto
ORDER BY
    COUNT() DESC
LIMIT 1;

-- 2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
SELECT
    aerolineas.nombre_aerolinea
FROM
    vuelos
LEFT JOIN
    aerolineas ON
        vuelos.id_aerolinea = aerolineas.id_aerolinea
GROUP BY
    vuelos.id_aerolinea
ORDER BY
    COUNT() DESC
LIMIT 1;

-- 3. ¿En qué día se han tenido mayor número de vuelos?
SELECT
    dia
FROM
    vuelos
GROUP BY
    dia
ORDER BY
    COUNT() DESC
LIMIT 1;

-- 4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
-- NOTA: Ninguna aerolínea tiene *más de* 2 vuelos *por día*, por lo que para que
--       al menos mostrara algo, hice que regresara los que tienen 2 *o más* por día.
SELECT
    aerolineas.nombre_aerolinea
   ,dia
   ,COUNT() as vuelos_ese_día
FROM
    vuelos
LEFT JOIN
    aerolineas ON
        vuelos.id_aerolinea = aerolineas.id_aerolinea
GROUP BY
    dia, vuelos.id_aerolinea
HAVING
    COUNT() >= 2
;