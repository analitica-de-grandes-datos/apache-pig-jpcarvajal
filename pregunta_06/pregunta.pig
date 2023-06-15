/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (mayu: chararray, minu: bag{t:tuple(f:chararray)}, arr: map[]);
flattened = foreach data generate FLATTEN(arr) as letras;
grouped = GROUP flattened BY letras;
r = foreach grouped generate group, COUNT(flattened);
STORE r into 'output/' USING PigStorage(',');
