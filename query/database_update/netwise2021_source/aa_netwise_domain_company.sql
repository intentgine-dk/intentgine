update ig_staging.company as t1
set email_domain = 	CASE
						WHEN t2.company_domain is not null and t2.company_domain != ''
						THEN lower(trim(replace(replace(replace(t2.company_domain, 'https://', ''), 'http://', ''), 'www.', '')))
						ELSE t1.email_domain
					END
from {0} as t2
where
	t1.company_data_status = 'Reverify'
	and (
		t1.email_domain = ''
		or trim(t1.email_domain) = ''
		)
	and t2.company_domain is not null
	and t2.company_domain != ''
	and trim(t2.company_domain) != ''
	and upper(trim(t1.company_name)) = upper(trim(t2.company_name));
	