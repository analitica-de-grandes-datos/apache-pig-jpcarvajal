/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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
filtro = FILTER data BY (SUBSTRING(UPPER(name), 0, 1)  >= 'M');
formatted = FOREACH data GENERATE SUBSTRING(birthdate, 0, 4), SUBSTRING(birthdate, 2, 4);
STORE formatted into 'output/' USING PigStorage(',');


