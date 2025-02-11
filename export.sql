CREATE TABLE APP.AULA (
	ID VARCHAR(255) NOT NULL,
	CAPACIDAD INTEGER,
	PRIMARY KEY (ID)
);
CREATE TABLE APP.CURSO (
	CODIGO VARCHAR(255) NOT NULL,
	DURACIONHORAS INTEGER,
	TEMA VARCHAR(255),
	TITULO VARCHAR(255),
	PRIMARY KEY (CODIGO)
);
CREATE TABLE APP.DIA (
	ID VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE TABLE APP.DIAS_CLASE (
	EDICION_ID VARCHAR(255) NOT NULL,
	DIASCLASE_ID VARCHAR(255) NOT NULL,
	PRIMARY KEY (DIASCLASE_ID,EDICION_ID)
);
ALTER TABLE APP.DIAS_CLASE
	ADD FOREIGN KEY (DIASCLASE_ID) 
	REFERENCES APP.DIA (ID);

ALTER TABLE APP.DIAS_CLASE
	ADD FOREIGN KEY (EDICION_ID) 
	REFERENCES APP.EDICION (ID);


CREATE TABLE APP.EDICION (
	ID VARCHAR(255) NOT NULL,
	FECHAFIN DATE,
	FECHAINICIO DATE,
	AULA_ID VARCHAR(255),
	CURSO_CODIGO VARCHAR(255),
	DOCENTE_CI INTEGER,
	PRIMARY KEY (ID)
);
ALTER TABLE APP.EDICION
	ADD FOREIGN KEY (AULA_ID) 
	REFERENCES APP.AULA (ID);

ALTER TABLE APP.EDICION
	ADD FOREIGN KEY (CURSO_CODIGO) 
	REFERENCES APP.CURSO (CODIGO);

ALTER TABLE APP.EDICION
	ADD FOREIGN KEY (ID) 
	REFERENCES APP.EDICION (ID);

ALTER TABLE APP.EDICION
	ADD FOREIGN KEY (DOCENTE_CI) 
	REFERENCES APP.EMPLEADO (CI);


CREATE TABLE APP.EMPLEADO (
	CI INTEGER NOT NULL,
	FECHAINGRESO DATE,
	NOMBRE VARCHAR(255),
	PRIMARY KEY (CI)
);
CREATE TABLE APP.INSCRIPCION (
	ID_ALUMNO INTEGER NOT NULL,
	ID_EDICION VARCHAR(255) NOT NULL,
	FECHAINSCRIPCION DATE,
	NOTA INTEGER,
	PRIMARY KEY (ID_ALUMNO,ID_EDICION)
);
CREATE TABLE APP.REQUISITO (
	CURSO_CODIGO VARCHAR(255) NOT NULL,
	REQUISITOS_CODIGO VARCHAR(255) NOT NULL,
	PRIMARY KEY (CURSO_CODIGO,REQUISITOS_CODIGO)
);
ALTER TABLE APP.REQUISITO
	ADD FOREIGN KEY (REQUISITOS_CODIGO) 
	REFERENCES APP.CURSO (CODIGO);

ALTER TABLE APP.REQUISITO
	ADD FOREIGN KEY (CURSO_CODIGO) 
	REFERENCES APP.CURSO (CODIGO);


