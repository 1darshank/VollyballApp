select ts.team_id,
	   t.name,
	   sum(ts.points) as points,
	   sum(ts.lead_score) as score_lead
from (
	select 
		id,
		case when home_team_score > visitor_team_score then home_team_id
			else visitor_team_id
		end	as team_id,
		2 as points,
		case when home_team_score > visitor_team_score then home_team_score - visitor_team_score
			else visitor_team_score - home_team_score
		end	as lead_score
	from game
	group by id	
	
	union 
	
	select 
		id,
		case when home_team_score > visitor_team_score then visitor_team_id
			else home_team_id
		end	as team_id,
		0 as points,
		0 as lead_score
	from game
	group by id	
			
) ts inner join  team t on ts.team_id = t.id
group by ts.team_id, t.name
order by points desc , score_lead desc