# Employee Database with SQL

***University of Toronto - Data Analytics Boot Camp - Module 7 - Employee Database with SQL***

---

## Overview of Project

Pewlett Hackard is a company that facing a Silver Tsunami, which means numerus employees will be retired in near future. Thus they have to something about it. First thing first; they should extract retiring employees' information.

---

## Results

* **Table 1: Retirement Titles**
    * Extracted the information about employees who are retiring including their titles.This table contains duplicates since an employee can be get promotion and posess a new title.
  
![](/Resources/Table1.png)

---

* **Table 2: Unique Titles**
    * Extracted last title of every retiring employees. This table contains only unique information for each employee.

![](/Resources/Table2.png)

---

* **Table 3: Retiring Titles**
    * This table includes the number of retiring employees categorized by their titles.

![](/Resources/Table3.png)

---

* **Table 4: Mentorship Eligibility**
    * Extract the information of eligible employees for the mentorship program
  
![](/Resources/Table4.png)

---

## Summary

### Question 1: How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Using the below query, we can see there will be more than **70,000** vacancies in the company in near future.

      SELECT
         COUNT(title)
      FROM
         unique_titles;
   
![](/Resources/Table5.png)
   
---   

### Question 2: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

With the help of the following query, we can see that there is only **1500** potential employee for the mentorship program.

      SELECT
         COUNT(title)
      FROM
         mentorship_eligibility;
         
![](/Resources/Table6.png)

---

It seems the filtering criteria is a little too strict. We have to reconsider it. For example, we have to give a chance to a little older (than who born in 1965) individuals. At least it gives us a couple of years to recruit people for dealing with the Silver Tsunami.

Looking at the query below, we can have more than **75,000** eligible ones just if we consider 1961 born employees instead of 1965.

      SELECT DISTINCT ON (em.emp_no)
         em.emp_no,
         em.first_name,
         em.last_name,
         em.birth_date,
         de.from_date,
         de.to_date,
         ti.title
      INTO
         mentorship_eligibility
      FROM
         employees AS em
         LEFT JOIN
         dept_emp AS de
         ON
         em.emp_no = de.emp_no
         LEFT JOIN
         titles AS ti
         ON
         em.emp_no = ti.emp_no
      WHERE
         (de.to_date = '9999-01-01')
         AND
         (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
      ORDER BY
         em.emp_no;
         
This way, we can create a balance between retiring employees and eligible candidates.
