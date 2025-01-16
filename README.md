In this assignment, we will explore the creation and management of SQL tables,
as well as the implementation of triggers to enforce data integrity and monitor database operations. The tasks involve creating a teachers table,
defining triggers for specific database actions, and maintaining a log of these actions in a teacher_log table.
The assignment demonstrates how triggers can automate error-checking and logging in a database system.

Steps Covered in the Assignment

Create a teachers Table:
A table named teachers will be created with fields for id, name, subject, experience, and salary. Eight rows of sample data will be inserted into the table.

Create a BEFORE INSERT Trigger:
A trigger named before_insert_teacher will be implemented to validate that the salary value is not negative.
If the salary is less than zero, an error will be raised with the message: "Salary cannot be negative."

Create an AFTER INSERT Trigger:
A trigger named after_insert_teacher will be created to log every insertion into the teachers table.
It will insert the teacher_id, the action performed (INSERT), and the current timestamp into a separate teacher_log table.

Create a BEFORE DELETE Trigger:
A trigger will be created to prevent deletion of rows where the experience is greater than 10 years.
An error message will be raised to notify users attempting this operation.

Create an AFTER DELETE Trigger:
A trigger will log details to the teacher_log table whenever a row is deleted from the teachers table.
The teacher_id, action performed (DELETE), and the timestamp of deletion will be recorded.

