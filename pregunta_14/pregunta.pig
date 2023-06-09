/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id:int,
            name:chararray,
            lastName:chararray,
            birthdate:chararray,
            color:chararray,
            number:int
    );
filtro = FILTER data BY NOT color matches '^b.*';
r = FOREACH filtro GENERATE color;
STORE r into 'output/' USING PigStorage(',');

