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
            birthdate:chararray,
            color:chararray,
            number:int
    );
years = FOREACH data GENERATE SUBSTRING(birthdate, 0, 4) as yr;
grouped = GROUP years BY yr;
r = FOREACH grouped GENERATE group AS yr, COUNT(years) AS count;
STORE r into 'output/' USING PigStorage(',');

