update ig_staging.company as t1
set company_linkedin_url = 'https://www.' + trim(t2.company_linkedin_url)
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.company_linkedin_url = ''
		or trim(t1.company_linkedin_url) = ''
		)
	and t2.company_linkedin_url is not null
	and t2.company_linkedin_url != ''
	and trim(t2.company_linkedin_url) != ''
	and t1.email_domain is not null
	and t1.email_domain != ''
	and trim(t1.email_domain) != ''
	and lower(trim(t1.email_domain)) = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')));