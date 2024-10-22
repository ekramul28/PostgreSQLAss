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

INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES 
(1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
(2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
(3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
(4, 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
(5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
(6, 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

-- courses data added 

INSERT INTO courses (course_id, course_name, credits)
VALUES 
(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Databases', 3),
(4, 'Prisma', 3);

-- add data of enrollment
INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);