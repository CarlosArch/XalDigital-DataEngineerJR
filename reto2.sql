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
   FOREIGN KEY(id_aerolinea) REFERENCES aerolineas (id_aerolinea)
   FOREIGN KEY(id_aeropuerto) REFERENCES aeropuertos (id_aeropuerto)
   FOREIGN KEY(id_movimiento) REFERENCES movimientos (id_movimiento)
);
