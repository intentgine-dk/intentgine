update ig_staging.company as t1
set naics_code = t2.naics_code1
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.naics_code is null
	and t2.naics_code1 is not null
	and t2.naics_code1 != 0
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url))
	and t2.naics_code1 in (select naics_code from ig_master.naics_code);