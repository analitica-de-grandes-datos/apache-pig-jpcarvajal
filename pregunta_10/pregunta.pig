/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

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
longitud = foreach data GENERATE lastName,SIZE(lastName) as length;
ordered = order longitud by length desc, lastName;
r = ordered limit 5;                                   
STORE r into 'output/' USING PigStorage(',');