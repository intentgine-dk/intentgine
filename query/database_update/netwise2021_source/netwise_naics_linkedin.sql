update ig_staging.company as t1
set naics_code = t2.company_primary_naics_code
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.naics_code is NULL
		or t1.naics_code = 0
	)
	and t2.company_primary_naics_code is not null
	and t2.company_primary_naics_code != 0
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url))
	and t2.company_primary_naics_code in (select naics_code from ig_master.naics_code);