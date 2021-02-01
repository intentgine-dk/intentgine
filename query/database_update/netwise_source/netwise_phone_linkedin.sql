update ig_staging.company as t1
set phone_number =	CASE
						WHEN trim(t2.company_phone_local) != '' and t2.company_phone_local is not null
						THEN trim(t2.company_phone_local)
					ELSE t1.phone_number
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_phone_local is not null
	and t2.company_phone_local != ''
	and trim(t2.company_phone_local) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));