update ig_staging.company as t1
set phone_number = trim(t2.phone_office)
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.phone_number is null
		or t1.phone_number = ''
		or trim(t1.phone_number) = ''
		)
	and t2.phone_office is not null
	and t2.phone_office != ''
	and trim(t2.phone_office) != ''
	and t1.company_linkedin_url is not null
	and t1.company_linkedin_url != ''
	and trim(t1.company_linkedin_url) != '' 
	and lower(trim(replace(t1.company_linkedin_url, 'https://www.', ''))) = lower(trim(t2.company_linkedin_url));