update ig_staging.company as t1
set email_domain =	CASE
						WHEN t2.company_website is not null and trim(t2.company_website) != ''
						THEN lower(trim(replace(replace(replace(t2.company_website, 'https://', ''), 'http://', ''), 'www.', '')))
						ELSE t1.email_domain
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and t2.company_website is not null
	and t2.company_website != ''
	and trim(t2.company_website) != ''
	and lower(trim(t1.company_linkedin_url)) = lower(trim(t2.company_linkedin_url));