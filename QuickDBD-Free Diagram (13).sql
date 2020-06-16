﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JuWDih
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- develop model

CREATE TABLE "departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dep_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(30)   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL
);

CREATE TABLE "dep_manager" (
    "dept_no" varchar(30)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL,
    CONSTRAINT "pk_dep_manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar(30)   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(30)   NOT NULL,
    "hire_date" varchar(30)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "salary_id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" varchar(30)   NOT NULL,
    "to_date" varchar(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_name" FOREIGN KEY("dept_name")
REFERENCES "dep_manager" ("dept_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dep_manager" ("dept_no");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "titles" ("title_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("salary_id");

