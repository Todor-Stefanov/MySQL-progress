# 1.	One-To-One Relationship

Create two tables as follows. Use appropriate data types.  

|people|
|person_id	|first_name	|salary	|passport_id|
| :---: | :---: | :---: | :---: |
|1|  	Roberto|   43300.00|	102|
|2	|Tom	|56100.00	|103|
|3|	Yana|	60200.00|	101|

|passports|
|passport_id|	passport_number|
| :---: | :---: |
|101	|N34FG21B|
|102|	K65LO4R7|
|103	|ZE657QP2|

Insert the data from the example above.
-	Alter table people and make person_id a primary key. 
-	Create a foreign key between people and passports by using the passport_id column. 
-	Think about which passport field should be UNIQUE.
-	Format salary to second digit after decimal point.

# 2.	One-To-Many Relationship
Create two tables as follows. Use appropriate data types.

|manufacturers|
|manufacturer_id|	name|	established_on|
| :---: | :---: | :---: |
|1  	|BMW |01/03/1916|
|2|	Tesla|	01/01/2003|
|3|	Lada	|01/05/1966|

|models|
|model_id	|name	|manufacturer_id|
| :---: | :---: | :---: |
|101	|X1	|1|
|102|	i6|	1|
|103	|Model S	|2|
|104|	Model X|	2|
|105	|Model 3	|2|
|106|	Nova|	3|


Insert the data from the example above. 
- Add primary and foreign keys.


# 3.	Many-To-Many Relationship
Create three tables as follows. Use appropriate data types.

|exams|
|exam_id|	name|
| :---: | :---: |
|101	|Spring MVC|
|102|	Neo4j|
|103	|Oracle 11g|

|students|
|student_id|	name|
| :---: | :---: |
|1  	|Mila|                             
|2|	Toni|
|3	|Ron|




|students_exams|
|student_id|	exam_id|
| :---: | :---: |
|1	|101|
|1|	102|
|2	|101|
|3|	103|
|2	|102|
|2|	103|

Insert the data from the example above.
-	Add primary and foreign keys.
-	Have in mind that the table student_exams should have a 
composite primary key.


# 4.	Self-Referencing

Create a single table as follows. Use appropriate data types.

|teachers|
|teacher_id|	name	|manager_id|
| :---: | :---: | :---: |
|101	|John|	|
|102|	Maya|	106|
|103	|Silvia	|106|
|104|	Ted|	105|
|105	|Mark	|101|
|106|	Greta|	101|


Insert the data from the example above. 
-	Add primary and foreign keys. 
-	The foreign key should be between manager_id and teacher_id.


# 7.	Peaks in Rila

Display all peaks for "Rila" mountain_range. Include:
-	mountain_range
-	peak_name
-	peak_elevation
Peaks should be sorted by peak_elevation descending.

Example

|mountain_range	|peak_name|peak_elevation|
| :---: | :---: | :---: |
|Rila	|Musala	|2925|
|…|	…|	…|
