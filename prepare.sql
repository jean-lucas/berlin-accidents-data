
# data: https://daten.berlin.de/datensaetze/strassenverkehrsunf%C3%A4lle-nach-unfallort-berlin-2019
# iconv -f ISO-8859-14 -t utf-8 accidents.csv > accidents-utf8.csv

CREATE TABLE accidents (
	OBJECTID int primary key,
	LAND  int,
	BEZ int,
	LOR int,
	STRASSE text,
	UJAHR int,
	UMONAT int,
	USTUNDE int,
	UWOCHENTAG int,
	UKATEGORIE int,
	UART int,
	UTYP1 int,
	ULICHTVERH int,
	IstRad bool,
	IstPKW bool,
	IstFuss bool,
	IstKrad bool,
	IstGkfz bool,
	IstSonstige bool,
	USTRZUSTAND int,
	LINREFX float8,
	LINREFY float8,
	XGCSWGS84 float8,
	YGCSWGS84 float8,
)

COPY accidents FROM 'accidents-utf8.csv' DELIMITER ';' CSV HEADER

ALTER TABLE accidents add pt_geom geometry(POINT, 31467);

with geom_val as (
	SELECT OBJECTID, ST_SetSRID(ST_MakePoint(XGCSWGS84, YGCSWGS84), 31467) as pt
	FROM accidents
)
update accidents as a
set pt_geom = b.pt
from geom_val b
where a.OBJECTID = b.OBJECTID;
