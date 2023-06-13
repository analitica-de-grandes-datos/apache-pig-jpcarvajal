/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, valor:int);
grouped_events = GROUP data BY letra;
r = FOREACH grouped_data GENERATE group AS letra, COUNT(data) AS count;

STORE r INTO 'output/' USING PigStorage(',');
