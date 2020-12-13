update ig_staging.company as t1
set company_linkedin_url = 'https://www.' + lower(trim(t2.linkedin_url))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.company_linkedin_url is null
		or t1.company_linkedin_url = ''
		or trim(t1.company_linkedin_url) = ''
		)
	and t2.company_linkedin_url is not null
	and t2.company_linkedin_url != ''
	and trim(t2.company_linkedin_url) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.name));