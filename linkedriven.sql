-- Utilizando uma query, obtenha todos os usuários (users) que 
-- vivem na cidade (cities) cujo nome seja “Rio de Janeiro”.

SELECT users.*, cities.id AS cities_id, cities.name AS city
FROM users
JOIN cities
ON users."cityId"=cities.id
WHERE cities.name = 'Rio de Janeiro'


-- Utilizando umas query, obtenha todos os depoimentos (testimonials) 
-- cadastrados, incluindo o nome do remetente e do destinatário.

SELECT testimonials.id, writer.name AS writer, recipient.name AS recipient, testimonials.message
FROM testimonials
JOIN users AS writer
ON "writerId"=writer.id
JOIN users AS recipient
ON "recipientId"=recipient.id


-- Utilizando uma query, obtenha todos os cursos (courses) que o usuário com id 30 
-- já finalizou, incluindo o nome da escola. O que indica que um usuário terminou 
-- um curso é o campo status da tabela educations, que deve estar como "finished".

SELECT educations.id, name.name, courses.name AS course, schools.name AS school, educations."endDate"
FROM educations
JOIN courses
ON "courseId"=courses.id
JOIN schools
ON "schoolId"=schools.id
JOIN users AS name
ON "userId"=name.id
WHERE "userId"=30
AND status='finished'


-- Utilizando uma query, obtenha as empresas (companies) para as quais o usuário com id 50 
-- trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o campo endDate da 
-- tabela experiences. Se ele estiver null (IS NULL), significa que a pessoa ainda não 
-- encerrou a experiência dela na empresa, ou seja, está trabalhando lá.

SELECT users.name, roles.name AS role, companies.name AS company, experiences."startDate"
FROM experiences
JOIN users
ON "userId"=users.id
JOIN companies
ON "companyId"=companies.id
JOIN roles
ON "roleId"=roles.id
WHERE "userId"=50
AND "endDate" IS NULL


-- ### Desafio Bônus

-- Utilizando uma *query*, obtenha a lista das diferentes escolas (`schools`) e cursos 
-- (`courses`) onde estudaram as pessoas que estão aplicando pra posição de **“Software 
-- Engineer”** na empresa com id **10**. Só devem ser consideradas as vagas que estiverem 
-- ativas, ou seja, quando o campo `active` da tabela `jobs` estiver **true**.

SELECT schools.id AS id, schools.name AS school, courses.name AS course, companies.name AS company
FROM applicants
JOIN jobs
ON "jobId"=jobs.id
JOIN roles
ON jobs."roleId"=roles.id
JOIN educations
ON applicants."userId"=educations."userId"
JOIN schools
ON educations."schoolId"=schools.id
JOIN courses
ON educations."courseId"=courses.id
JOIN companies
ON jobs."companyId" = companies.id
WHERE roles.name='Software Engineer'
AND "companyId"=10