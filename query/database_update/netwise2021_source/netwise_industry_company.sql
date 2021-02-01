update ig_staging.company as t1
set industry_id =  t2.industry_id
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.industry_id is null
	and t2.industry_id is not null
	
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));
