# Informe de análisis — Tabla `enrollments` (EduTrack)

Orden de ejecución: Q1–Q5 sobre los datos originales (17 inscripciones), Q6–Q8 para corregir los datos y Q9–Q12 sobre los datos corregidos (16 inscripciones).

## Q1 - Inscripciones en 'Intro to Python'

Resultado: 5

- Emily Watson — emily.watson@student.edutrack.com — 85 %
- Klaus Weber — klaus.weber@student.edutrack.com — 92 %
- Marco Rossi — marco.rossi@student.edutrack.com — 88 %
- James Miller — james.miller@test.com — 30 % (cuenta de prueba, se elimina en Q8)
- Priya Sharma — priya.sharma@student.edutrack.com — 55 %

## Q2 - Posibles abandonos (completado < 10 %)

Resultado: 4

- Yuki Nakamura — UI/UX Fundamentals — 0 %
- Pierre Dubois — UI/UX Fundamentals — 0 %
- Lucia Fernandes — Digital Marketing 101 — 3 %
- Lucia Fernandes — Web Design Basics — 5 %

## Q3 - Inscripciones sin instructor (NULL)

Resultado: 2

- id 10 — Yuki Nakamura — UI/UX Fundamentals
- id 11 — Pierre Dubois — UI/UX Fundamentals

## Q4 - Top 5 con mayor completado que no han aprobado

Resultado:

1. Emily Watson — Web Design Basics — 60 %
2. Priya Sharma — Intro to Python — 55 %
3. Yuki Nakamura — Data Analysis with SQL — 45 %
4. Emily Watson — Advanced Python — 40 %
5. James Miller — Intro to Python — 30 %

## Q5 - Inscripciones desde el 2024-07-01 (más reciente primero)

Resultado: 9

- 2025-03-05 — Emily Watson — Advanced Python
- 2025-02-20 — Pierre Dubois — Data Analysis with SQL
- 2025-01-10 — Priya Sharma — Intro to Python
- 2024-12-01 — Priya Sharma — Digital Marketing 101
- 2024-11-05 — Pierre Dubois — UI/UX Fundamentals
- 2024-10-11 — Yuki Nakamura — UI/UX Fundamentals
- 2024-09-03 — Yuki Nakamura — Data Analysis with SQL
- 2024-08-09 — Marco Rossi — Intro to Python
- 2024-07-01 — Lucia Fernandes — Digital Marketing 101

## Q6 - Inserción de la inscripción que faltaba

Resultado: 1 fila insertada

- id 18 — Lucia Fernandes — Advanced Python — Programming — 2025-04-01 — 0 % — no aprobado — 69.99 — Carlos Vega

## Q7 - Asignación de instructor por defecto

Resultado: 2 filas actualizadas

- id 10 — Yuki Nakamura — UI/UX Fundamentals → 'Pending assignment'
- id 11 — Pierre Dubois — UI/UX Fundamentals → 'Pending assignment'

## Q8 - Eliminación de cuentas de prueba (@test.com)

Resultado: 2 filas eliminadas (confirmadas antes con SELECT)

- id 13 — James Miller — james.miller@test.com — Intro to Python
- id 14 — Alex Chen — alex.chen@test.com — Web Design Basics

## Q9 - Inscripciones por categoría

Resultado:

- Programming: 7
- Design: 4
- Data: 3
- Marketing: 2

## Q10 - Promedio de completado por curso (menor a mayor)

Resultado:

- UI/UX Fundamentals: 0.00 %
- Web Design Basics: 32.50 %
- Digital Marketing 101: 36.50 %
- Advanced Python: 45.00 %
- Data Analysis with SQL: 47.67 %
- Intro to Python: 80.00 %

## Q11 - Cursos con más de 3 inscripciones

Resultado: 1

- Intro to Python: 4

## Q12 - Ingresos totales por categoría (mayor a menor)

Resultado:

- Programming: 409.93
- Data: 179.97
- Design: 169.96
- Marketing: 59.98

## Conclusiones

- **Abandonos**: 4 inscripciones por debajo del 10 %. Las dos de UI/UX Fundamentals están al 0 % y además no tenían instructor asignado.
- **Peor rendimiento**: Design es la categoría con menor completado medio (16.25 %), seguida de Marketing (36.5 %). UI/UX Fundamentals es el curso más débil (0 %).
- **Ingresos**: Programming genera más que el resto de categorías juntas (409.93 de 819.84 en total).
- **Limpieza**: se han añadido 1 inscripción, corregido 2 y eliminado 2. La tabla queda con 16 inscripciones.
