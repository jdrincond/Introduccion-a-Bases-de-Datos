/*
ALTER TABLE
Lección 13.9: https://youtu.be/OuJerKzV5T0?t=12461
*/

/*
ADD
Lección 13.10: https://youtu.be/OuJerKzV5T0?t=12578
*/

-- ADD: Añade un nuevo atributo surname a la tabla "persons7"
ALTER TABLE persons7
ADD surname varchar(150);

/*
RENAME COLUMN
Lección 13.11: https://youtu.be/OuJerKzV5T0?t=12624
*/

-- RENAME COLUMN: Renombra el atributo surname a description en la tabla "persons87"
ALTER TABLE persons7
RENAME COLUMN surname TO description;

/*
MODIFY COLUMN
Lección 13.12: https://youtu.be/OuJerKzV5T0?t=12675
*/

-- MODIFY COLUMN: Modifica el tipo de dato del atributo description en la tabla "persons8"
ALTER TABLE persons7
MODIFY COLUMN description varchar(250);

/*
DROP COLUMN
Lección 13.13: https://youtu.be/OuJerKzV5T0?t=12712
*/

-- DROP COLUMN: Elimina el atributo description en la tabla "persons7"
ALTER TABLE persons7
DROP COLUMN description;