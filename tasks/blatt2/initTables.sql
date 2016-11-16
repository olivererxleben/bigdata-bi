USE datashot;


# employees
create table if not exists bdbi_EMP (
	ENO varchar(2) not null,
	ENAME varchar(10),
	TITLE varchar(20),
	primary key (ENO)
);

truncate table bdbi_EMP;

INSERT INTO bdbi_EMP values 
	("E1", "J. Doe", "Elect. Eng"),
	("E2", "M.Smith", "Syst. Anal."),
	("E3", "A.  Lee", "Mech. Eng."),
	("E4", "J. Miller", "Programmer"),
	("E5", "B. Casey", "Sys. Anal."),
 	("E6", "L. Chu", "Elect. Eng"),
 	("E7", "R. Davis", "Mech. Eng."),
  	("E8", "J. Jones", "Syst. Anal.")
;

select * from bdbi_EMP;

# Projects

create table if not exists bdbi_PROJ (
	PNO varchar(2) not null,
	PNAME varchar(20),
	BUDGET INT,
	LOC varchar(10),
	primary key (PNO)
);

truncate table bdbi_PROJ;

insert into bdbi_PROJ values 
	("P1", "Instrumentation", 150000, "Montreal"),
	("P2", "Database Development", 135000, "New York"),
	("P3", "CAD/CAM", 250000, "New York"),
	("P4", "Maintenance", 31000, "Paris")
;

select * from bdbi_PROJ;

# Pays

create table if not exists bdbi_PAY (
	TITLE varchar(20),
	SAL INT
);

truncate table bdbi_PAY;

insert into bdbi_PAY values
	("Elect. Eng.", 40000),
	("Syst. Anal.", 34000),
	("Mech. Eng.", 27000),
	("Programmer", 24000)
;

select * from bdbi_PAY;

# ASG

create table if not exists bdbi_ASG (
	ENO varchar(2) not null,
	PNO varchar(2) not null,
	RESP varchar(20),
	DUR INT,
	foreign key (ENO) references bdbi_EMP(ENO),
	foreign key (PNO) references bdbi_PROJ(PNO)
);

truncate table bdbi_ASG;

insert into bdbi_ASG values
	("E1", "P1", "Manager", 12),
	("E2", "P1", "Analyst", 24),
	("E2", "P2", "Analyst", 6),
	("E3", "P3", "Consultant", 10),
	("E3", "P4", "Engineer", 48),
	("E4", "P2", "Programmer", 18),
	("E5", "P2", "Manager", 24),
	("E6", "P4", "Manager", 48),
	("E7", "P3", "Engineer", 36),
	("E8", "P3", "Manager", 40)
;

select * from bdbi_ASG