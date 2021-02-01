update ig_staging.company as t1
set revenue_range_id =  t2.revenue_range_id
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.revenue_range_id is null
	and t2.revenue_range_id is not null
	
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));
