update ig_staging.company as t1
set employee_size_id =  t2.employee_size_id
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	--and t1.employee_size_id is null
	and t2.employee_size_id is not null

	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));