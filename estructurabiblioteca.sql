drop schema if exists biblioteca;
CREATE SCHEMA biblioteca;
SET FOREIGN_KEY_CHECKS=0;
/*socios (DNI, COD_SOCIO, Dirección, Teléfono, Nombre, Sexo)
Volúmenes (ID_VOLUMEN, Estado, Título, Fecha_Publicación,fk_ISBN)
Editoriales (ID_Editorial, Nombre editorial)
Libros (ISBN, año escritura, título)
Autores (ID Autor, nombre)
Prestamos (fk_Cod_SOCIO, fk_ID_VOLUMEN, FECHA PRESTAMO, fecha tope)
Publican (fk_ID VOLUMEN, fk_ID_EDITORIAL)
Autores_Escriben_Libros (fk_ISBN, fk_ID_AUTOR)*/

CREATE TABLE biblioteca.editorial(
    ID_Editorial INT NOT NULL UNIQUE,
    Nombre_Editorial VARCHAR(25) NOT NULL,
    PRIMARY KEY (ID_Editorial)
);

CREATE TABLE biblioteca.libros(
    ISBN VARCHAR(13) NOT NULL,
    Año_Escritura INT NOT NULL,
    Título VARCHAR(150) NOT NULL,
    fk_ID_Editorial INT NOT NULL,
    PRIMARY KEY (ISBN),
    CONSTRAINT fk_ID_Editorial FOREIGN KEY (fk_ID_Editorial) REFERENCES biblioteca.editorial(ID_Editorial)
);

drop table if exists biblioteca.volumen;
CREATE TABLE biblioteca.volumen(
    ID_VOLUMEN INT NOT NULL UNIQUE AUTO_INCREMENT,
    Estado VARCHAR(15) NOT NULL,
    Título VARCHAR(30) NOT NULL,
    Fecha_Publicación DATE NOT NULL,
    fk_ISBN VARCHAR(13) NOT NULL,
    PRIMARY KEY (ID_VOLUMEN),
    CONSTRAINT FOREIGN KEY (fk_ISBN) REFERENCES biblioteca.libros (ISBN)
);

drop table if exists biblioteca.socios;
CREATE TABLE biblioteca.socios(
    DNI CHAR(9) NOT NULL UNIQUE,
    COD_SOCIO INT NOT NULL AUTO_INCREMENT,
    Dirección VARCHAR(25) NOT NULL,
    Teléfono INT NOT NULL,
    Nombre VARCHAR(25) NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    PRIMARY KEY (COD_SOCIO)
);

drop table if exists biblioteca.prestamos;
CREATE TABLE biblioteca.prestamos(
    fk_Cod_SOCIO INT NOT NULL AUTO_INCREMENT, 
    fk_ID_VOLUMEN INT NOT NULL,
    FECHA_PRESTAMO DATE NOT NULL,
    FECHA_TOPE DATE NOT NULL,
    PRIMARY KEY (fk_Cod_SOCIO, fk_ID_VOLUMEN),
	CONSTRAINT FOREIGN KEY (fk_COD_SOCIO) REFERENCES biblioteca.socios(COD_SOCIO),
	CONSTRAINT FOREIGN KEY (fk_ID_VOLUMEN) REFERENCES biblioteca.volumen(ID_VOLUMEN)
);

drop table if exists biblioteca.editorial;
CREATE TABLE biblioteca.editorial(
    ID_Editorial INT NOT NULL UNIQUE,
    Nombre_Editorial VARCHAR(25) NOT NULL,
    PRIMARY KEY (ID_Editorial)
);

INSERT INTO biblioteca.editorial(
    ID_Editorial,
    Nombre_Editorial
)   VALUES (
    '12311232',
    'Libracos S.L'
);

INSERT INTO biblioteca.editorial(
    ID_Editorial,
    Nombre_Editorial
)   VALUES (
    '12386732',
    'Pereira S.L'
);

INSERT INTO biblioteca.editorial(
    ID_Editorial,
    Nombre_Editorial
)   VALUES (
    '123167232',
    'El circulo de lectores'
);

INSERT INTO biblioteca.editorial(
    ID_Editorial,
    Nombre_Editorial
)   VALUES (
    '87611232',
    'Perreras S.A.'
);

INSERT INTO biblioteca.editorial(
    ID_Editorial,
    Nombre_Editorial
)   VALUES (
    '12316532',
    'Leer y aprender'
);

INSERT INTO biblioteca.libros(
    ISBN,
    Año_Escritura,
    Título,
    fk_ID_Editorial
)   VALUES (
    '9780590353403',
    '1981',
    'La odisea de los pitufos',
    '12311232'
);

INSERT INTO biblioteca.libros(
    ISBN,
    Año_Escritura,
    Título,
    fk_ID_Editorial
)   VALUES (
    '9780590353402',
    '1954',
    'El señor de los buñuelos',
    '12386732'
);

INSERT INTO biblioteca.libros(
    ISBN,
    Año_Escritura,
    Título,
    fk_ID_Editorial
)   VALUES (
    '9568847035413',
    '1912',
    'Los tres mosqueteros',
    '123167232'
);

INSERT INTO biblioteca.libros(
    ISBN,
    Año_Escritura,
    Título,
    fk_ID_Editorial
)   VALUES (
    '9780590359684',
    '1156',
    'Los niguelungos',
    '87611232'
);

INSERT INTO biblioteca.libros(
    ISBN,
    Año_Escritura,
    Título,
    fk_ID_Editorial
)   VALUES (
    '9780590359541',
    '1954',
    'Pantuflas',
    '12316532'
);


INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '1111',
    'Malillo',
    'La odisea de los pitufos',
    '1986-09-02',
    '9780590353403'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '1241',
    'Malo',
    'La odisea de los pitufos',
    '1986-09-02',
    '9780590353403'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '2212',
    'Muy bueno',
    'El señor de los buñuelos',
    '1985-07-02',
    '9780590353402'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '4212',
    'Malo',
    'El señor de los buñuelos',
    '1985-07-02',
    '9780590353402'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '8213',
    'Bueno',
    'Pantuflas',
    '2004-01-02',
    '9780590359541'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '1513',
    'Medio',
    'Pantuflas',
    '2004-01-02',
    '9780590359541'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '1294',
    'Bueno',
    'Los tres mosqueteros',
    '1985-07-02',
    '9568847035413'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '1219',
    'Bueno',
    'Los tres mosqueteros',
    '1985-07-02',
    '9568847035413'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '6215',
    'Malo',
    'Los niguelungos',
    '1985-07-02',
    '9780590359684'
);

INSERT INTO biblioteca.volumen(
    ID_VOLUMEN,
    Estado,
    Título,
    Fecha_Publicación,
    fk_ISBN
)   VALUES (
    '7215',
    'Medio',
    'Los niguelungos',
    '1985-07-02',
    '9780590359684'
);

INSERT INTO biblioteca.socios(
    DNI,
    COD_SOCIO,
    Dirección,
    Teléfono,
    Nombre,
    Sexo
)   VALUES (
    '62004204A',
    '12345',
    'Calle molona 76',
    '952412789',
    'Perez',
    'Masculino'
);

INSERT INTO biblioteca.socios(
    DNI,
    COD_SOCIO,
    Dirección,
    Teléfono,
    Nombre,
    Sexo
)   VALUES (
    '65003204B',
    '12346',
    'Calle morena 3',
    '952456789',
    'Pepa Pig',
    'Femenino'
);

INSERT INTO biblioteca.socios(
    DNI,
    COD_SOCIO,
    Dirección,
    Teléfono,
    Nombre,
    Sexo
)   VALUES (
    '65014204V',
    '12347',
    'Calle rancia 75',
    '952412789',
    'Josefa Perez',
    'Femenino'
);

INSERT INTO biblioteca.socios(
    DNI,
    COD_SOCIO,
    Dirección,
    Teléfono,
    Nombre,
    Sexo
)   VALUES (
    '65004704C',
    '12348',
    'Calle verdadera 13',
    '952473289',
    'Melenao Soez',
    'Masculino'
);

INSERT INTO biblioteca.socios(
    DNI,
    COD_SOCIO,
    Dirección,
    Teléfono,
    Nombre,
    Sexo
)   VALUES (
    '65005424X',
    '12349',
    'Calle lujosa 43',
    '952456718',
    'Pepita Huertas',
    'Femenino'
);


INSERT INTO biblioteca.prestamos(
    fk_Cod_SOCIO,
    fk_ID_VOLUMEN,
    FECHA_PRESTAMO,
    FECHA_TOPE
)   VALUES (
    '12349',
    '1',
    '2019-01-12',
    '2019-02-22'
);

INSERT INTO biblioteca.prestamos(
    fk_Cod_SOCIO,
    fk_ID_VOLUMEN,
    FECHA_PRESTAMO,
    FECHA_TOPE
)   VALUES (
    '12348',
    '1',
    '2019-01-01',
    '2019-01-04'
);

INSERT INTO biblioteca.prestamos(
    fk_Cod_SOCIO,
    fk_ID_VOLUMEN,
    FECHA_PRESTAMO,
    FECHA_TOPE
)   VALUES (
    '12345',
    '1',
    '2019-09-02',
    '2019-10-01'
);

INSERT INTO biblioteca.prestamos(
    fk_Cod_SOCIO,
    fk_ID_VOLUMEN,
    FECHA_PRESTAMO,
    FECHA_TOPE
)   VALUES (
    '12346',
    '1',
    '2019-07-01',
    '2019-09-02'
);
