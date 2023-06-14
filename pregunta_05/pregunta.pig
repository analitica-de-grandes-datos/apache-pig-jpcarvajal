/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (mayu: chararray, minu: bag{t:tuple(f:chararray)}, arr: chararray);
flattened = foreach data generate FLATTEN(minu) as letra;
grouped = GROUP flattened BY letra;
r = foreach grouped generate group, COUNT(flattened);
STORE r into 'output/' USING PigStorage(',');

