/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (mayu: chararray, minu: bag{t:tuple(f:chararray)}, arr: map[]);
generated = foreach data generate FLATTEN(minu) as minusculas, FLATTEN(arr) as arreglos;
nueva_columna = foreach generated generate (minusculas, arreglos) as tupla;
grouped = group nueva_columna BY tupla;
r = FOREACH grouped GENERATE group, COUNT(nueva_columna);
STORE r into 'output/' USING PigStorage(',');

