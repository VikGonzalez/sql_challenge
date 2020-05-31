CREATE TABLE "employees"(
	"emp_no" INT NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"first_name" VARCHAR NOT NULL,
	"gender" VARCHAR NOT NULL,
	"salary" INT NOT NULL,
	"dept_no" INT NOT NULL,
	"dept_name" VARCHAR NOT NULL,	
	-- CONVERTIR A FECHA
	"hire_date" VARCHAR NOT NULL,
	"from_date" VARCHAR NOT NULL,
	"to_date" VARCHAR NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY (
	"emp_no"
	)
);

CREATE TABLE "departments"(
	"dept_id" INT NOT NULL,
	"dept_no" INT NOT NULL,
	"dept_name" VARCHAR NOT NULL
);

CREATE TABLE "dept_emp"(
	"dept_emp_id" INT NOT NULL,
	"emp_no" INT NOT NULL,
	"employee_id" INT NOT NULL,
	"dept_no" VARCHAR NOT NULL,
	"from_date" VARCHAR(10) NOT NULL,
	"to_date" VARCHAR(10) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY(
	"dept_emp_id"
	)
);

CREATE TABLE "dept_manager"(
	"dept_man_id" INT NOT NULL,
	"emp_no" INT NOT NULL,
	"dept_no" INT NOT NULL,
	"from_date" VARCHAR(10) NOT NULL,
	"to_date" VARCHAR(10) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY(
	"dept_man_id"
	)
);

CREATE TABLE "salaries"(
	"salary_id" INT NOT NULL,
	"emp_no" INT NOT NULL,
	"dept_no" INT NOT NULL,
	"from_date" VARCHAR(10) NOT NULL,
	"to_date" VARCHAR(10) NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY(
	"salary_id"
	)
);

CREATE TABLE "titles"(
	"title_id" INT NOT NULL,
	"emp_no" INT NOT NULL,
	"dept_no" INT NOT NULL,
	"from_date" VARCHAR(10) NOT NULL,
	"to_date" VARCHAR(10) NOT NULL,
	CONSTRAINT "pk_titles" PRIMARY KEY(
	"title_id"
	)
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


