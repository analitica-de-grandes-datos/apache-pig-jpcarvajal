/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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
            eventType:chararray,
            birthdate:chararray,
            color:chararray,
            number:int,
    );
años = FOREACH data GENERATE SUBSTRING(birthdate, 0, 4) as year;
grouped = GROUP años BY year;
r = foreach grouped GENERATE GROUP as year, COUNT(Years);
STORE r into 'output/' USING PigStorage(',');

