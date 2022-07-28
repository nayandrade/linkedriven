-- Utilizando uma query, obtenha a quantidade de experiências (experiences) 
-- atuais, ou seja, com “endDate” diferente de NULL.

SELECT COUNT("userId") AS "currentExperiences"
FROM experiences
WHERE "endDate" IS NOT NULL


-- Utilizando uma query, obtenha a quantidade de graduações (educations) por usuário, 
-- incluindo o seu id.

SELECT "userId" AS "id", COUNT("userId") AS educations
FROM educations
GROUP BY "userId"
ORDER BY "id"


-- Utilizando uma query, obtenha a quantidade de depoimentos(testimonials) que o 
-- usuário com id 435 efetuou, incluindo o seu nome. 

SELECT users.name AS writer, COUNT("message") AS "testimonialsCount"
FROM testimonials
JOIN users ON testimonials."writerId" = users.id
WHERE "writerId" = 435
GROUP BY writer


-- Utilizando uma query, obtenha o maior salário das vagas (jobs) ativas (active = true) 
-- e o nome das posições (roles) dessas vagas ordenadas de forma ascendente

SELECT MAX(salary) AS "maximumSalary", roles.name AS role
FROM jobs
JOIN roles ON "roleId" = roles.id
WHERE active = true
GROUP BY "roleId", roles.name
ORDER BY "maximumSalary"


-- Utilizando uma query, obtenha os 3 cursos (courses) e escolas (schools) com a maior 
-- quantidade de alunos (educations) que estão cursando (status='ongoing' ) ou 
-- finalizaram (status='finished') 

