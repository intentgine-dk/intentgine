update ig_staging.company as t1
set street_address =	CASE
							WHEN upper(trim(t2.company_address)) != '' and t2.company_address is not null
							then upper(trim(t2.company_address))
							ELSE t1.street_address
						END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_address is not null
	and t2.company_address != ''
	and trim(t2.company_address) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));