update ig_staging.company as t1
set street_address = t2.company_address1_headquarters
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.street_address IS NULL
		OR TRIM(t1.street_address) = ''
	)
	and t2.company_address1_headquarters is not null
	and t2.company_address1_headquarters != ''
	and trim(t2.company_address1_headquarters) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));

