update ig_staging.company as t1
set sic_code = t2.sic_code1
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t1.sic_code is null
	and t2.sic_code1 is not null
	and t2.sic_code1 != 0
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url))
	and t2.sic_code1 in (select sic_code from ig_master.sic_code);