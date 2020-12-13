update ig_staging.company as t1
set email_domain = lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.email_domain is null
		or t1.email_domain = ''
		or trim(t1.email_domain) = ''
		)
	and t2.company_website is not null
	and t2.company_website != ''
	and trim(t2.company_website) != ''
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));