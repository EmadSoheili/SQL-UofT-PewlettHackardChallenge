# Employee Database with SQL

***University of Toronto - Data Analytics Boot Camp - Module 6 - Employee Database with SQL***

---

## Overview of Project

Pewlett Hackard is a company that facing a Silver Tsunami, which means numerus employees will be retired in near future. Thus they have to something about it. First thing first; they should extract retiring employees' information.

---

## Results

* Table 1: Retirement Titles
    * Extracted the information about employees who are retiring including their titles.This table contains duplicates since an employee can be get promotion and posess a new title.
  
![](/Resources/Table1.PNG)

* Table 2: Unique Titles
    * Extracted last title of every retiring employees. This table contains only unique information for each employee.
  
![](/Resources/Table2.PNG)

* Table 3: Retiring Titles
    * This table includes the number of retiring employees categorized by their titles.
  
![](/Resources/Table3.PNG)

* Table 3: Mentorship Eligibility
    * Extract the information of eligible employees for the mentorship program
  
![](/Resources/Table4.PNG)

---

## Summary

### Question 1: How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Using the below query, we can see there will be more than ***70,000*** vacancies in the company in near future.

      *SELECT
         COUNT(title)
      FROM
         unique_titles*
   
![](/Resources/Table5.PNG)
   
---   

With the help of the following query, we can see 
