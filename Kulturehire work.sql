USE genzdataset ;
SHOW tables ;
select * from learning_aspirations;

select * from mission_aspirations;
select* from manager_aspirations;
select* from personalized_info;

-- Q1 How many males have responded from india?
SELECT COUNT(*) AS Male_Respondents
FROM personalized_info
WHERE Gender LIKE "Male%" AND CurrentCountry="India";

-- Q2 How many Females have responded from india?
SELECT COUNT(*) AS Female_Respondents
FROM personalized_info
WHERE Gender LIKE "Female%" AND CurrentCountry="India";

-- Q3 How many GenZ are influenced by their parents in regards to their career choices from India?
select count(*) as GenZ_aspirants
from personalized_info p
inner join learning_aspirations l
on p.ResponseID=l.ResponseID
where p.CurrentCountry="India" and CareerInfluenceFactor="My Parents";

 -- Q4 How many Female GenZ are influenced by their parents in regards to their career choices from India?
 select count(*) as Female_aspirants
from personalized_info p
inner join learning_aspirations l
on p.ResponseID=l.ResponseID
where p.Gender like "Female%" and  p.CurrentCountry="India" and CareerInfluenceFactor="My Parents";

-- Q. How many Male GenZ are influenced by their parents in regards to their career choices from India?
select count(*) as Male_aspirants
from personalized_info p
inner join learning_aspirations l
on p.ResponseID=l.ResponseID
where p.Gender like "Male%" and  p.CurrentCountry="India" and CareerInfluenceFactor="My Parents";

-- Q. How many Male and Female GenZ are influenced by their parents in regards to their career choices from India?
select 
	count(case when p.Gender like "Male%" then 1 end) as Male_aspirants,
	count(case when p.Gender like "Female%" then 1 end) as Female_aspirants
from personalized_info p
 join learning_aspirations l
on p.ResponseID=l.ResponseID
where  p.CurrentCountry="India" and CareerInfluenceFactor="My Parents";

-- Q. How many GenZ are influenced by social media and influencers together from india?
select 
	count(case when l.CareerInfluenceFactor like "Social%" then 1 end) as SocialMedia,
	count(case when l.CareerInfluenceFactor like "Influencers%" then 1 end) as Influencers
from  learning_aspirations l
 join personalized_info p
on p.ResponseID=l.ResponseID
where  p.CurrentCountry="India" ;
 
 -- Q  How many GenZ are influenced by social media and influencers together display male and female seperately from india? 
Select CareerInfluenceFactor,
	count(case when p.Gender like "Male%" then 1 end) as Male_aspirations,
	count(case when p.Gender like "Female%" then 1 end) as Female_aspirations
from personalized_info p 
 join learning_aspirations l
on p.ResponseID=l.ResponseID
where  p.CurrentCountry="India"
group by l.CareerInfluenceFactor
limit 2 offset 1 ;







-- Q How many GenZ are influenced by social media for thier career aspiration are looking to go to abroad?
Select count(*) as GenZ_aspirants
from learning_aspirations
where HigherEducationAbroad like "Yes%"
and CareerInfluenceFactor like "Social%" ;



-- Q How many GenZ are influenced by people in thier circle for career aspiration are looking to go to abroad?
Select count(*) as GenZ_aspirants
from learning_aspirations
where HigherEducationAbroad like "Yes%"
and CareerInfluenceFactor like "%Circle%" ;





