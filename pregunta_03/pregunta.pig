/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, valor:int);
ordered_data = ORDER data BY valor desc;
limited = LIMIT ordered_data 5;
valores = for each limited GENERATE valor;
STORE valores into 'output/' USING PigStorage(',');