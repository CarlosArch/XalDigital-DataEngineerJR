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
   ,nombre_aerolinea TEXT
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
   ,nombre_aerolinea
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