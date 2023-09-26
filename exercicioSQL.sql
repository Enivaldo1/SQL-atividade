create database exercicios;
use exercicios;

create table distribution_companies(

	id int primary key,
    company_name varchar(120)
);

create table movies(

	id int primary key,
    movie_title varchar(120),
    imdb_rating decimal(3,1),
    budget decimal(10,2),
    box_office decimal(10,2),
    distribuiton_company_id int,
    constraint fkmoviescompanies foreign key (distribuiton_company_id) references distribution_companies(id),
    lenguage varchar(50)    
);

alter table movies
add year_release int;

insert into distribution_companies values (1,'Columbia Pictures'),(2,'Paramount Pictures'),
(3,	'Warner Bros. Pictures'),
(4,	'United Artists'),
(5,	'Universal Pictures'),
(6,	'New Line Cinema'),
(7,	'Miramax Films'),
(8,	'Produzioni Europee Associate'),
(9,	'Buena Vista'),
(10,'StudioCanal');


insert into movies(id, movie_title,imdb_rating, year_release, budget ,box_office, distribuiton_company_id, lenguage) values 
(1, 'The Shawshank Redemption',	9.2,	1994,	25.00,	73.30,	1,	'English'),
(2,	'The Godfather',	9.2,	1972	,7.20	,291.00	,2	,'English'),
(3,	'The Dark Knight',	9.0	,2008,	185.00	,1.006,	3	,'English'),
(4,	'The Godfather Part II',	9.0	,1974,	13.00,	93.00,	2,	'English, Sicilian'),
(5,	'12 Angry Men',	9.0	,1957,	0.34,	2.00,	4,	'English'),
(6,	'Schindlers List',	8.9,	1993,	22.00,	322.20,	5,	'English, German, Yiddish'),
(7, 'The Lord of the Rings: The Return of the King',	8.9	,2003,	94.00,	1.146,	6,	'English'),
(8,	'Pulp Fiction',	8.8, 1994	,8.50	,213.90	,7,	'English'),
(9,	'The Lord of the Rings: The Fellowship of the Ring',	8.8,	2001,	93.00,	898.20,	6,	'English'),
(10, 'The Good, the Bad and the Ugly',	8.8,	1966,	1.20,	38.90,	8,	'English, Italian, Spanish');

-- Seleção de todas as colunas de uma tabela
select * from distribution_companies;

-- Seleção de algumas colunas em uma tabela
select movie_title, imdb_rating, year_release from movies;

-- Seleção de algumas colunas e filtragem de dados numéricos em WHERE
select movie_title, box_office from movies where box_office > 300;

-- Seleção de algumas colunas e filtragem de dados de texto em WHERE
select movie_title, imdb_rating, year_release from movies where movie_title like '%Godfather%';

-- Seleção de algumas colunas e filtragem de dados usando duas condições em WHERE
select movie_title, imdb_rating, year_release from movies where imdb_rating > 9 and year_release < 2001;

-- Filtragem de dados usando WHERE e classificando o resultado
select movie_title, imdb_rating, year_release from movies where  year_release > 1991 order by year_release asc;

-- Agrupamento de dados em uma coluna: Mostrando a contagem de filmes por cada categoria de idioma.
select lenguage, count(*) as 'number_of_movies'
from movies
group by lenguage;

/* Agrupamento de dados por várias colunas: 
Mostra a contagem de filmes por ano de lançamento e idioma
Classificando os resultados pela data de lançamento em ordem crescente.*/
select year_release, lenguage, count(*) as 'number_movies' 
from movies
group by year_release , lenguage
order by year_release asc;

/*Filtragem de dados após o agrupamento:
 Mostra os idiomas falados e o orçamento médio dos filmes por categoria de idioma
 Mostrar somente os idiomas com um orçamento médio acima de US$ 50 milhões.*/
 select lenguage, avg(budget) as 'movie_budget' from movies
 group by lenguage having avg(budget) > 50;
 
 /* Seleção de colunas de duas tabelas 
 Mostrar títulos de filmes da tabela movies cada um com o nome de sua empresa de distribuição.*/
 select movie_title, company_name 
 from movies
 inner join distribution_companies 
 on movies.distribuiton_company_id = distribution_companies.id