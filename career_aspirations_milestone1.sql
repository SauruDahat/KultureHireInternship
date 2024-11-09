---Q4
select gender, ---count(career_aspirations_influences) as influences,
	(
		count(career_aspirations_influences)*100 /
		(
			select count(*) from milestone 
			where country = 'India'
		)
	) as influence_percent
from milestone 
where country='India'
group by gender

---Q5
select work_for_one_employer_3_years_or_more, 
	(
		count(work_for_one_employer_3_years_or_more)*100.0 /
		(
			select count(*) from milestone
			where country='India'
		)
	)as percent_of_workers
from milestone
where country = 'India'
group by work_for_one_employer_3_years_or_more

---Q6
with company_percentage as(
select work_for_a_company_whose_mission_is_not_bringing_social_impact,
	(
	count(work_for_a_company_whose_mission_is_not_bringing_social_impact)*100.0 /
		(
			select count(*) from milestone where country='India'
			)
	)as percent_workers
from milestone
where country='India'
and cast(work_for_a_company_whose_mission_is_not_bringing_social_impact as int)
between 1 and 5
group by work_for_a_company_whose_mission_is_not_bringing_social_impact
limit 5
)
select work_for_a_company_whose_mission_is_not_bringing_social_impact,percent_workers,
(
select sum(percent_workers) from company_percentage
) as total_percentage 
from company_percentage




	