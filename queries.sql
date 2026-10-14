-- ============================================================
-- EduTrack — Auditoría de la tabla enrollments
-- Ejecutar en el SQL Editor de Supabase EN ESTE ORDEN:
-- Q1–Q5 (lectura) → Q6–Q8 (corrección) → Q9–Q12 (agregación)
-- ============================================================


-- ------------------------------------------------------------
-- LECTURA Y FILTRADO
-- ------------------------------------------------------------

-- Q1. Inscripciones del curso 'Intro to Python'
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

-- Q2. Posibles abandonos (completado < 10 %)
SELECT id, student_name, course_title, completion_percentage
FROM enrollments
WHERE completion_percentage < 10
ORDER BY completion_percentage ASC;

-- Q3. Inscripciones sin instructor
SELECT id, student_name, course_title, instructor
FROM enrollments
WHERE instructor IS NULL;

-- Q4. Top 5 con más progreso que todavía no han aprobado
SELECT student_name, course_title, completion_percentage
FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5;

-- Q5. Inscripciones desde el 2024-07-01, de la más reciente a la más antigua
SELECT id, student_name, course_title, enrollment_date
FROM enrollments
WHERE enrollment_date >= '2024-07-01'
ORDER BY enrollment_date DESC;


-- ------------------------------------------------------------
-- CORRECCIÓN DE DATOS
-- ------------------------------------------------------------

-- Q6. Insertar la inscripción que faltaba (id = 18)
INSERT INTO enrollments (
    id, student_id, student_name, student_email,
    course_id, course_title, category, enrollment_date,
    completion_percentage, passed, monthly_fee_paid, instructor
)
VALUES (
    18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com',
    5, 'Advanced Python', 'Programming', '2025-04-01',
    0, false, 69.99, 'Carlos Vega'
)
RETURNING *;

-- Comprobación de Q6
SELECT * FROM enrollments WHERE id = 18;

-- Q7. Asignar instructor por defecto a los registros sin instructor
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL
RETURNING id, student_name, course_title, instructor;

-- Q8 (paso 1). SELECT previo: confirmar qué filas se van a borrar
SELECT id, student_name, student_email, course_title
FROM enrollments
WHERE student_email ILIKE '%@test.com';

-- Q8 (paso 2). Borrar las inscripciones de cuentas de prueba
DELETE FROM enrollments
WHERE student_email ILIKE '%@test.com'
RETURNING id, student_name, student_email;


-- ------------------------------------------------------------
-- AGREGACIÓN E INFORME (se ejecutan con los datos ya corregidos)
-- ------------------------------------------------------------

-- Q9. Número de inscripciones por categoría
SELECT category, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY category
ORDER BY total_enrollments DESC;

-- Q10. Promedio de completado por curso, de menor a mayor
SELECT course_title, ROUND(AVG(completion_percentage), 2) AS avg_completion
FROM enrollments
GROUP BY course_title
ORDER BY avg_completion ASC;

-- Q11. Cursos con más de 3 inscripciones
SELECT course_title, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

-- Q12. Ingresos totales por categoría, de mayor a menor
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;
