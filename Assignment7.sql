-- Active: 1729154538545@@127.0.0.1@5432@university_db

-- Creating student Table 
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INTEGER,
    email VARCHAR(100),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);

-- CREATING course Table

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credits INTEGER
);

-- creating enrollment table 
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);

-- student data added

INSERT INTO students ( student_name, age, email, frontend_mark, backend_mark, status)
VALUES 
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- courses data added 

INSERT INTO courses (course_name, credits)
VALUES 
( 'Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- add data of enrollment
INSERT INTO enrollment (student_id, course_id)
VALUES 
( 1, 1),
( 1, 2),
( 2, 1),
( 3, 2);


SELECT * FROM students

SELECT * FROM courses

SELECT * FROM enrollment



-- Query 1
-- insert a new student 

INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status)
VALUES('Md Ekramul Haque',22,'mdekramulhassan168@gmail.com',60,60,NULL);

-- Query 2
-- Retrieve names of students enrolled in 'Next.js'

SELECT s.student_name 
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- Query 2
-- or or
SELECT s.student_name 
FROM students s
JOIN enrollment e USING(student_id) 
JOIN courses c USING(course_id)
WHERE c.course_name = 'Next.js';


-- update status of the  student with height total marks
SELECT * FROM students WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
);

UPDATE students 
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
);

-- DELETE all course where student dosen't enrol

DELETE FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM enrollment
);


-- Retrieve student names with LIMIT and OFFSET
SELECT student_name 
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;

-- Retrieve course names and number of students enrolled
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Calculate the average age of students
SELECT AVG(age) AS average_age
FROM students;


-- Retrieve names of students with emails containing 'example.com'

SELECT student_name 
FROM students
WHERE email LIKE '%example.com%';
