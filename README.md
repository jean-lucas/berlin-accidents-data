# berlin-accidents-data


Dataset Repo: [daten.berlin.de](https://daten.berlin.de/datensaetze/strassenverkehrsunf%C3%A4lle-nach-unfallort-berlin-2019)

Convert csv to `psql` friendly encoding:

`iconv -f ISO-8859-14 -t utf-8 accidents.csv > accidents-utf8.csv`
